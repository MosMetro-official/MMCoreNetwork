//
//  SwiftyJSON_Int_Doube.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    public var double: Double? {
        get {
            return number?.doubleValue
        }
        set {
            if let newValue = newValue {
                object = NSNumber(value: newValue)
            } else {
                object = NSNull()
            }
        }
    }

    public var doubleValue: Double {
        get {
            return numberValue.doubleValue
        }
        set {
            object = NSNumber(value: newValue)
        }
    }

    public var float: Float? {
        get {
            return number?.floatValue
        }
        set {
            if let newValue = newValue {
                object = NSNumber(value: newValue)
            } else {
                object = NSNull()
            }
        }
    }

    public var floatValue: Float {
        get {
            return numberValue.floatValue
        }
        set {
            object = NSNumber(value: newValue)
        }
    }

    public var int: Int? {
        get {
            return number?.intValue
        }
        set {
            if let newValue = newValue {
                object = NSNumber(value: newValue)
            } else {
                object = NSNull()
            }
        }
    }

    public var intValue: Int {
        get {
            return numberValue.intValue
        }
        set {
            object = NSNumber(value: newValue)
        }
    }
}
