//
//  Test_DictionaryExt.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import XCTest
@testable import CoreNetwork

class Test_DictionaryExt : XCTestCase {
    
    func test_QueryStringReturnsAwesomeStuff() {
        let result = "test=testing"
        let testingBody = ["test":"testing"]
        XCTAssertEqual(testingBody.queryString, result)
    }
}
