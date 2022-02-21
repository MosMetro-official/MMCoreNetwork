//
//  HTTPContentType.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

public enum HTTPContentType : String {
    case json = "application/json"
    case formData = "multipart/form-data;"
    case urlEncoded = "application/x-www-form-urlencoded"
    
    case other = "" // TESTING
}
