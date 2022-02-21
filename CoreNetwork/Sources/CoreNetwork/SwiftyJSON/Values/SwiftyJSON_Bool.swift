//
//  SwiftyJSON_Bool.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON { // : Swift.Bool

    //Optional bool
    public var bool: Bool? {
        get {
            switch type {
            case .bool: return rawBool
            default:    return nil
            }
        }
        set {
            object = newValue ?? NSNull()
        }
    }

    //Non-optional bool
    public var boolValue: Bool {
        get {
            switch type {
            case .bool:   return rawBool
            case .number: return rawNumber.boolValue
            case .string: return ["true", "y", "t", "yes", "1"].contains { rawString.caseInsensitiveCompare($0) == .orderedSame }
            default:      return false
            }
        }
        set {
            object = newValue
        }
    }
}
