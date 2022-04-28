//
//  Test_Responce.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import XCTest
@testable import CoreNetwork

class Test_Responce : XCTestCase {
    
    func test_Init() {
        let resp = Response(
            data: "data",
            success: true,
            statusCode: 405
        )
        XCTAssertEqual(resp.data as! String, "data")
        XCTAssertEqual(resp.success, true)
        XCTAssertEqual(resp.statusCode, 405)
    }
}
