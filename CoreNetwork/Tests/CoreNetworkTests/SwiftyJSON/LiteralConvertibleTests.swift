//
//  LiteralConvertibleTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class LiteralConvertibleTests : XCTestCase {
    
    func test_Number() {
        let json: JSON = 1234567890.876623
        XCTAssertEqual(json.int!, 1234567890)
        XCTAssertEqual(json.intValue, 1234567890)
        XCTAssertEqual(json.double!, 1234567890.876623)
        XCTAssertEqual(json.doubleValue, 1234567890.876623)
        XCTAssertTrue(json.float! == 1234567890.876623)
        XCTAssertTrue(json.floatValue == 1234567890.876623)
    }
    
    func test_Bool() {
        let jsonTrue: JSON = true
        XCTAssertEqual(jsonTrue.bool!, true)
        XCTAssertEqual(jsonTrue.boolValue, true)
        let jsonFalse: JSON = false
        XCTAssertEqual(jsonFalse.bool!, false)
        XCTAssertEqual(jsonFalse.boolValue, false)
    }
    
    func test_String() {
        let json: JSON = "abcd efg, HIJK;LMn"
        XCTAssertEqual(json.string!, "abcd efg, HIJK;LMn")
        XCTAssertEqual(json.stringValue, "abcd efg, HIJK;LMn")
    }
    
    func test_Nil() {
        let jsonNil_1: JSON = JSON.null
        XCTAssert(jsonNil_1 == JSON.null)
        let jsonNil_2: JSON = JSON(NSNull.self)
        XCTAssert(jsonNil_2 != JSON.null)
        let jsonNil_3: JSON = JSON([1: 2])
        XCTAssert(jsonNil_3 != JSON.null)
    }
    
    func test_Array() {
        let json: JSON = [1, 2, "4", 5, "6"]
        XCTAssertEqual(json.array!, [1, 2, "4", 5, "6"])
        XCTAssertEqual(json.arrayValue, [1, 2, "4", 5, "6"])
    }
    
    func test_Dictionary() {
        let json: JSON = ["1": 2, "2": 2, "three": 3, "list": ["aa", "bb", "dd"]]
        XCTAssertEqual(json.dictionary!, ["1": 2, "2": 2, "three": 3, "list": ["aa", "bb", "dd"]])
        XCTAssertEqual(json.dictionaryValue, ["1": 2, "2": 2, "three": 3, "list": ["aa", "bb", "dd"]])
    }
}
