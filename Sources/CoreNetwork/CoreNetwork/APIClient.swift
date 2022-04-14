//
//  APIClient.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

public class APIClient {
    internal let host : String
    internal let session : URLSession
    internal let interceptor : APIClientInterceptor
    internal let httpProtocol : HTTPProtocol
    
    public init(
        host: String,
        interceptor: APIClientInterceptor? = nil,
        httpProtocol: HTTPProtocol = .HTTPS,
        configuration: URLSessionConfiguration = .default
    ) {
        self.host = host
        self.session = URLSession(configuration: configuration)
        self.interceptor = interceptor ?? DefaultAPIClientInterceptor()
        self.httpProtocol = httpProtocol
    }
    
    public func send(_ request: Request, schouldPrint: Bool = false, completion: @escaping (Result<Response,APIError>) -> Void)  {
        guard
            let url = try? makeURL(
                path: request.path,
                query: request.query
            )
        else {
            completion(.failure(APIError.badData))
            return
        }
        
        guard
            var urlRequest = try? makeRequest(
                url: url,
                method: request.method.rawValue,
                body: request.body,
                contentType: request.contentType
            )
        else {
            completion(.failure(APIError.badData))
            return
        }
#if DEBUG
        if schouldPrint {
            print("🚧🚧🚧 MAKING URL REQUEST:\n\(urlRequest.url?.absoluteString ?? "empty URL")\n")
        }
#endif
        interceptor.client(self, willSendRequest: &urlRequest)
        let task = session.dataTask(with: urlRequest) { data, httpResponse, error in
            if let error = error {
#if DEBUG
                print(error.localizedDescription)
#endif
                // тут хендлить повторный реквест не надо, как правило тут ошибки транспортные
                completion(.failure(.badRequest))
                return
            }
            
            guard let httpResponse = httpResponse as? HTTPURLResponse else {
                completion(.failure(.noHTTPResponse))
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                // handling HTTP error
                self.interceptor.client(self, initialRequest: request, didReceiveInvalidResponse: httpResponse, data: data) { [weak self] retryPolicy in
                    guard let self = self else { return }
                    switch retryPolicy {
                    case .shouldRetry:
                        self.send(request) { result in
                            completion(result)
                            return
                        }
                    case .doNotRetry:
                        completion(.failure(.unacceptableStatusCode(httpResponse.statusCode)))
                        return
                    case .doNotRetryWith(let retryError):
                        completion(.failure(retryError))
                        return
                    }
                }
            } else {
                guard let _data = data else {
                    completion(.failure(.badData))
                    return
                }
                
                #if DEBUG
                print("🚧🚧🚧 JSON RESPONSE:\n\(JSON(_data))\n")
                #endif
                let response = Response(
                    data : _data,
                    success : true,
                    statusCode:  httpResponse.statusCode
                )
                completion(.success(response))
                return
            }
            
            
        }
        task.resume()
        
        
    }
}

extension APIClient {
    
    private func makeURL(path: String, query: [String: String]?) throws -> URL {
        guard
            let url = URL(string: path),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            throw URLError(.badURL)
        }
        if path.starts(with: "/") {
            components.scheme = self.httpProtocol.rawValue
            components.host = host
        }
        if let query = query {
            components.queryItems = query.map(URLQueryItem.init)
        }
        guard
            let url = components.url
        else {
            throw URLError(.badURL)
        }
        return url
    }
    
    private func makeRequest(url: URL, method: String, body: [String: Any]?, contentType: HTTPContentType) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let body = body {
            request.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
            switch contentType {
            case .json:
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
                
            case .formData:
                break
                
            case .urlEncoded:
                let postString = body.queryString
                let str = postString
                    .replacingOccurrences(of: "[", with: "{")
                    .replacingOccurrences(of: "]", with: "}")
                request.httpBody = str.data(using: .utf8)
                
            case .other:
                break
            }
            #if DEBUG
            print("🔔 REQUEST BODY\n\n\(request.httpBody as Any))\n")
            #endif
        }
        return request
    }
}
