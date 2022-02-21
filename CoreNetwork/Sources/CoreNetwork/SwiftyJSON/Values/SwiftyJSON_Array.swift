//
//  SwiftyJSON_Array.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    //Optional [JSON]
    public var array: [JSON]? {
        return type == .array ? rawArray.map { JSON($0) } : nil
    }

    //Non-optional [JSON]
    public var arrayValue: [JSON] {
        return self.array ?? []
    }

    //Optional [Any]
    public var arrayObject: [Any]? {
        get {
            switch type {
            case .array: return rawArray
            default:     return nil
            }
        }
        set {
            self.object = newValue ?? NSNull()
        }
    }
}
