//
//  SwiftyJSON__Type.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

/**
JSON's type definitions.

See http://www.json.org
*/
public enum Type: Int {
    case number
    case string
    case bool
    case array
    case dictionary
    case null
    case unknown
}
