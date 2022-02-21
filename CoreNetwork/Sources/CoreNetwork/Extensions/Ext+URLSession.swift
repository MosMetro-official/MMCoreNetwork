//
//  Ext+URLSession.swift
//  
//
//  Created by Павел Кузин on 08/02/2022.
//

import Foundation

// TODO: Не понимаю как это протестировать =(
@MainActor
extension URLSession {
    
    @available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
    func data(from request: URLRequest) async throws -> (Data?, URLResponse?, Error?) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: request) { data, response, error in
                continuation.resume(returning: (data, response, error))
            }
            task.resume()
        }
    }
}
