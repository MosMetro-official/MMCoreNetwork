//
//  Test_APIError.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import XCTest
@testable import CoreNetwork

class Test_APIError : XCTestCase {
    
    func test_APIError() {
        let data = APIError.badURL
        XCTAssertEqual(data.errorTitle, "😣😣😣 URL is bad.")
        XCTAssertEqual(data.errorSubtitle, "Don't worry, it's not your fault.")
        XCTAssertEqual(data.errorDescription, "😣😣😣 URL is bad.")
        
        let data1 = APIError.badData
        XCTAssertEqual(data1.errorTitle, "😣😣😣 The data we received is bad.")
        XCTAssertEqual(data1.errorSubtitle, "Don't worry, it's not your fault.")
        XCTAssertEqual(data1.errorDescription, "😣😣😣 The data we received is bad.")
        
        let data2 = APIError.badRequest
        XCTAssertEqual(data2.errorTitle, "😣😣😣 Couldn't send a request.")
        XCTAssertEqual(data2.errorSubtitle, "Don't worry, it's not your fault.")
        XCTAssertEqual(data2.errorDescription, "😣😣😣 Couldn't send a request.")
        
        let data3 = APIError.noHTTPResponse
        XCTAssertEqual(data3.errorTitle, "😣😣😣 The server didn't send anything.")
        XCTAssertEqual(data3.errorSubtitle, "Don't worry, it's not your fault.")
        XCTAssertEqual(data3.errorDescription, "😣😣😣 The server didn't send anything.")
        
        let data4 = APIError.unacceptableStatusCode(0)
        XCTAssertEqual(data4.errorTitle, "😣😣😣 Response status code was unacceptable: 0.")
        XCTAssertEqual(data4.errorSubtitle, "Don't worry, it's not your fault.")
        XCTAssertEqual(data4.errorDescription, "😣😣😣 Response status code was unacceptable: 0.")
    }
}
