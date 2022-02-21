//
//  SwiftyJSON_Collection.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON: Swift.Collection {

    public typealias Index = JSONRawIndex

    public var startIndex: Index {
        switch type {
        case .array:
            return .array(rawArray.startIndex)
            
        case .dictionary:
            return .dictionary(rawDictionary.startIndex)
            
        default:
            return .null
        }
    }

    public var endIndex: Index {
        switch type {
        case .array:
            return .array(rawArray.endIndex)
            
        case .dictionary:
            return .dictionary(rawDictionary.endIndex)
            
        default:
            return .null
        }
    }

    public func index(after i: Index) -> Index {
        switch i {
        case .array(let idx):
            return .array(rawArray.index(after: idx))
            
        case .dictionary(let idx):
            return .dictionary(rawDictionary.index(after: idx))
            
        default:
            return .null
        }
    }

    public subscript (position: Index) -> (String, JSON) {
        switch position {
        case .array(let idx):
            return (String(idx), JSON(rawArray[idx]))
            
        case .dictionary(let idx):
            return (rawDictionary[idx].key, JSON(rawDictionary[idx].value))
            
        default:
            return ("", JSON.null)
        }
    }
}
