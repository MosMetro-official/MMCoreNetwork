//
//  SwiftyJSONIndex.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

public typealias JSONIndex = Index<JSON>
public typealias JSONRawIndex = Index<Any>

public enum Index<T: Any>: Comparable {
    case null
    case array(Int)
    case dictionary(DictionaryIndex<String, T>)

    static public func == (lhs: Index, rhs: Index) -> Bool {
        switch (lhs, rhs) {
        case (.array(let left), .array(let right)):
            return left == right
            
        case (.dictionary(let left), .dictionary(let right)):
            return left == right
            
        case (.null, .null):
            return true
            
        default:
            return false
        }
    }

    static public func < (lhs: Index, rhs: Index) -> Bool {
        switch (lhs, rhs) {
        case (.array(let left), .array(let right)):
            return left < right
            
        case (.dictionary(let left), .dictionary(let right)):
            return left < right
            
        default:
            return false
        }
    }
}
