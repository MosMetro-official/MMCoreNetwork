//
//  SwiftyJSON_Dictionary.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    //Optional [String : JSON]
    public var dictionary: [String: JSON]? {
        if type == .dictionary {
            var d = [String: JSON](minimumCapacity: rawDictionary.count)
            rawDictionary.forEach { pair in
                d[pair.key] = JSON(pair.value)
            }
            return d
        } else {
            return nil
        }
    }

    //Non-optional [String : JSON]
    public var dictionaryValue: [String: JSON] {
        return dictionary ?? [:]
    }

    //Optional [String : Any]

    public var dictionaryObject: [String: Any]? {
        get {
            switch type {
            case .dictionary: return rawDictionary
            default:          return nil
            }
        }
        set {
            object = newValue ?? NSNull()
        }
    }
}
