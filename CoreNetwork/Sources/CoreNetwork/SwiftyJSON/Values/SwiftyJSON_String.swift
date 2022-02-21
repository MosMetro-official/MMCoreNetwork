//
//  SwiftyJSON_String.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    //Optional string
    public var string: String? {
        get {
            switch type {
            case .string: return object as? String
            default:      return nil
            }
        }
        set {
            object = newValue ?? NSNull()
        }
    }

    //Non-optional string
    public var stringValue: String {
        get {
            switch type {
            case .string: return object as? String ?? ""
            case .number: return rawNumber.stringValue
            case .bool:   return (object as? Bool).map { String($0) } ?? ""
            default:      return ""
            }
        }
        set {
            object = newValue
        }
    }
}
