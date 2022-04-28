//
//  Request.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

public struct Request {
    var path : String
    var body : [String: Any]?
    var query : [String: String]?
    var method : HTTPMethod
    var contentType : HTTPContentType
}

public extension Request {
    
    static func GET(path: String, query: [String:String]? = nil) -> Self {
        return Request(
            path: path,
            query: query,
            method: .GET,
            contentType: .json
        )
    }
    
    static func POST(path: String, body: [String:Any]? = nil, contentType: HTTPContentType) -> Self {
        return Request(
            path: path,
            body: body,
            method: .POST,
            contentType: contentType
        )
    }
    
    static func PUT(path: String, query: [String:String]? = nil) -> Self {
        return Request(
            path: path,
            query: query,
            method: .PUT,
            contentType: .json
        )
    }
    
    static func DELETE(path: String, query: [String:String]? = nil) -> Self {
        return Request(
            path: path,
            query: query,
            method: .DELETE,
            contentType: .json
        )
    }
}
