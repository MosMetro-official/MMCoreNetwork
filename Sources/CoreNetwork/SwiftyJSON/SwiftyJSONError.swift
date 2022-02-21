//
//  SwiftyJSONError.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

public enum SwiftyJSONError: Int, Swift.Error {
    case unsupportedType = 999
    case indexOutOfBounds = 900
    case elementTooDeep = 902
    case wrongType = 901
    case notExist = 500
    case invalidJSON = 490
}

extension SwiftyJSONError: CustomNSError {

    /// return the error domain of SwiftyJSONError
    public static var errorDomain: String { return "com.swiftyjson.SwiftyJSON" }

    /// return the error code of SwiftyJSONError
    public var errorCode: Int { return self.rawValue }

    /// return the userInfo of SwiftyJSONError
    public var errorUserInfo: [String: Any] {
        switch self {
        case .unsupportedType:
            return [NSLocalizedDescriptionKey: "It is an unsupported type."]
        case .indexOutOfBounds:
            return [NSLocalizedDescriptionKey: "Array Index is out of bounds."]
        case .wrongType:
            return [NSLocalizedDescriptionKey: "Couldn't merge, because the JSONs differ in type on top level."]
        case .notExist:
            return [NSLocalizedDescriptionKey: "Dictionary key does not exist."]
        case .invalidJSON:
            return [NSLocalizedDescriptionKey: "JSON is invalid."]
        case .elementTooDeep:
            return [NSLocalizedDescriptionKey: "Element too deep. Increase maxObjectDepth and make sure there is no reference loop."]
        }
    }
}
