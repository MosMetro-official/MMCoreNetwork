//
//  SwiftyJSON_Null.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    public var null: NSNull? {
        set {
            object = NSNull()
        }
        get {
            switch type {
            case .null: return rawNull
            default:    return nil
            }
        }
    }
    public func exists() -> Bool {
        if let errorValue = error, (400...1000).contains(errorValue.errorCode) {
            return false
        }
        return true
    }
}
