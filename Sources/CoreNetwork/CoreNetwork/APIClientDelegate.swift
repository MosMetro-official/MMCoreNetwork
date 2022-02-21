//
//  APIClientDelegate.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

public protocol APIClientDelegate {
    
    func client(_ client: APIClient, willSendRequest request: inout URLRequest)
    
    func client(_ client: APIClient, initialRequest: Request, didReceiveInvalidResponse response: HTTPURLResponse, data: Data?) async throws -> Response
}

public extension APIClientDelegate {
    
    func client(_ client: APIClient, willSendRequest request: inout URLRequest) { }
    
    func client(_ client: APIClient, initialRequest: Request, didReceiveInvalidResponse response: HTTPURLResponse, data: Data?) async throws -> Response {
        throw APIError.unacceptableStatusCode(response.statusCode)
    }
}

public final class DefaultAPIClientDelegate : APIClientDelegate { }
