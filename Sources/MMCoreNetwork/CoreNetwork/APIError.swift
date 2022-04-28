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
    case badMapping
    case noHTTPResponse
    case unacceptableStatusCode(Int)
    case genericError(String) /// error with message
    
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
        case .badMapping:
            return "😣😣😣 Couldn't serialize data"
            
        case .noHTTPResponse:
            return "😣😣😣 The server didn't send anything."
            
        case .unacceptableStatusCode(let statusCode):
            return "😣😣😣 Response status code was unacceptable: \(statusCode)."
            
        case .genericError(let message):
            return message
        }
    }
}
