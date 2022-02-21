# CoreNetwork

CoreNetwork module with the basic functionality of requests to the network.

## Integration

### if as local package
```swift
    dependencies: [
        .package(path: "../CoreNetwork")
    ],
```

### if as shared package
```swift
    dependencies: [
        .package(name: "CoreNetwork", url: "https://github.com/MosMetro-official/CoreNetwork.git", from: "0.0.1")
    ],
```

## Structure

The Package is a wrapper for easy network requests, that is includes SwiftyJSON lib inside. Available for iOS 13+, as it uses the async/await structure.

## Usage

First of all, it is necessary to designate the main host for the request - for different hosts, you can use different static variables, for convenience.
```swift
import CoreNetwork

extension APIClient {
    
    public static var myClient : APIClient {
        return APIClient(host: "YOUR_AWESOME_HOST.com")
    }
}
```
It's also possible at this stage to make a different host for several project profiles, when using, for example, SettingsBundle.
It should be noted that at this stage it is not necessary to attribute the protocol of using HTTP - this is done at the request stage, and HTTPS is always used by default.

Due to the fact that SwiftyJSON is already integrated, it does not need to be additionally connected to the project - we are closely monitoring its updates and updating our wrapper =)
```swift
func loadSomeStuff() async throws -> VALUE {
    let client = APIClient.myClient
    do {
        let responce = try await client.send(
            .GET(
                path: "/MY_AWESOME_PATH"
            )
        )
        let json = JSON(responce.data)
        let myValue : VALUE = json["VALUE_KEY"]
        return myValue
    } catch {
        throw error
    }
}
```
NOTE: Path must necessarily start with "/" -> it will throws a "badURL" error.

## Errors
In addition to the errors from SwiftyJSON, we also added 5 errors that can occur when working with the network:
```swift
    case badURL
    case badData
    case badRequest
    case noHTTPResponse
    case unacceptableStatusCode(Int)
```

The 'errorDescription' is not localized yet, so you can override them - it's OK)
```swift
public var errorDescription : String {
    switch self {
    case .badURL:
        return "😣😣😣 URL is bad."
        
    case .badData:
        return "😣😣😣 The data we received is bad."
        
    case .badRequest:
        return "😣😣😣 Couldn't send a request."
        
    case .noHTTPResponse:
        return "😣😣😣 The server didn't send anything."
        
    case .unacceptableStatusCode(let statusCode):
        return "😣😣😣 Response status code was unacceptable: \(statusCode)."
    }
}
```
