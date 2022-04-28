//
//  APIClientDelegate.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

public enum RetryPolicy {
    case shouldRetry
    case doNotRetry
    case doNotRetryWith(APIError)
}

public protocol APIClientInterceptor {
    func client(_ client: APIClient, willSendRequest request: inout URLRequest)
    
    func client(_ client: APIClient, initialRequest: Request, didReceiveInvalidResponse response: HTTPURLResponse, data: Data?, completion: @escaping (RetryPolicy) -> Void)
}



public final class DefaultAPIClientInterceptor : APIClientInterceptor {
    public func client(_ client: APIClient, willSendRequest request: inout URLRequest) { }
    
    public func client(_ client: APIClient, initialRequest: Request, didReceiveInvalidResponse response: HTTPURLResponse, data: Data?, completion: @escaping (RetryPolicy) -> Void) {
        completion(.doNotRetry)
    }
    
    
}
