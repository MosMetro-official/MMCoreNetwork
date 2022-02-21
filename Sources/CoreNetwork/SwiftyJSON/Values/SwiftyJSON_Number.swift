//
//  SwiftyJSON_Number.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    //Optional number
    public var number: NSNumber? {
        get {
            switch type {
            case .number:
                return rawNumber
                
            case .bool:
                return NSNumber(value: rawBool ? 1 : 0)
                
            default:
                return nil
            }
        }
        set {
            object = newValue ?? NSNull()
        }
    }

    //Non-optional number
    public var numberValue: NSNumber {
        get {
            switch type {
            case .string:
                let decimal = NSDecimalNumber(string: object as? String)
                return decimal == .notANumber ? .zero : decimal
                
            case .number:
                return object as? NSNumber ?? NSNumber(value: 0)
                
            case .bool:
                return NSNumber(value: rawBool ? 1 : 0)
                
            default:
                return NSNumber(value: 0.0)
            }
        }
        set {
            object = newValue
        }
    }
}
