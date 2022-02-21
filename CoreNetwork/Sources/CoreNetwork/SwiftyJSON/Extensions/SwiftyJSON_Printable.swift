//
//  SwiftyJSON_Printable.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON: Swift.CustomStringConvertible, Swift.CustomDebugStringConvertible {

    public var description: String {
        return rawString(options: .prettyPrinted) ?? "unknown"
    }

    public var debugDescription: String {
        return description
    }
}
