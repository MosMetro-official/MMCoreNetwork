//
//  APIError.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

public enum APIError: Error, LocalizedError {
    case badURL
    case badData
    case badRequest
    case noHTTPResponse
    case unacceptableStatusCode(Int)
    
    public var errorTitle : String {
        return errorDescription
    }
    
    public var errorSubtitle : String {
        switch self {
        default :
            return "Don't worry, it's not your fault."
        }
    }
    
    public var errorDescription : String {
        switch self {
        case .badURL:
            return "😣😣😣 URL is bad."
            
        case .badData:
            return "😣😣😣 The data we received is bad."
            
        case .badRequest:
            return "😣😣😣 Couldn't send a request."
            
        case .noHTTPResponse:
            return "😣😣😣 The server didn't send anything."
            
        case .unacceptableStatusCode(let statusCode):
            return "😣😣😣 Response status code was unacceptable: \(statusCode)."
        }
    }
}
