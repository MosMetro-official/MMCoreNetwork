//
//  File.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON {

    //Optional URL
    public var url: URL? {
        get {
            switch type {
            case .string:
                // Check for existing percent escapes first to prevent double-escaping of % character
                if rawString.range(of: "%[0-9A-Fa-f]{2}", options: .regularExpression, range: nil, locale: nil) != nil {
                    return Foundation.URL(string: rawString)
                } else if let encodedString_ = rawString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                    // We have to use `Foundation.URL` otherwise it conflicts with the variable name.
                    return Foundation.URL(string: encodedString_)
                } else {
                    return nil
                }
            default:
                return nil
            }
        }
        set {
            object = newValue?.absoluteString ?? NSNull()
        }
    }
}
