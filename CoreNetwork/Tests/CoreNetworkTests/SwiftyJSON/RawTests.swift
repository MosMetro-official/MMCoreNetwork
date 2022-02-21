//
//  RawTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class RawTests : XCTestCase {

    func testRawData() {
        let json: JSON = ["somekey": "some string value"]
        let expectedRawData = "{\"somekey\":\"some string value\"}".data(using: String.Encoding.utf8)
        do {
            let data: Data = try json.rawData()
            XCTAssertEqual(expectedRawData, data)
        } catch _ {}
    }

    func testInvalidJSONForRawData() {
        let json: JSON = "...<nonsense>xyz</nonsense>"
        do {
            _ = try json.rawData()
        } catch let error as SwiftyJSONError {
            XCTAssertEqual(error, SwiftyJSONError.invalidJSON)
        } catch _ {}
    }

    func testArray() {
        let json: JSON = [1, "2", 3.12, NSNull(), true, ["name": "Jack"]]
        let data: Data?
        do {
            data = try json.rawData()
        } catch _ {
            data = nil
        }
        let string = json.rawString()
        XCTAssertTrue (data != nil)
        XCTAssertTrue (string!.lengthOfBytes(using: String.Encoding.utf8) > 0)
    }

    func testDictionary() {
        let json: JSON = ["number": 111111.23456789, "name": "Jack", "list": [1, 2, 3, 4], "bool": false, "null": NSNull()]
        let data: Data?
        do {
            data = try json.rawData()
        } catch _ {
            data = nil
        }
        let string = json.rawString()
        XCTAssertTrue (data != nil)
        XCTAssertTrue (string!.lengthOfBytes(using: String.Encoding.utf8) > 0)
    }

    func testString() {
        let json: JSON = "I'm a json"
        XCTAssertEqual(json.rawString(), "I'm a json")
    }

    func testNumber() {
        let json: JSON = 123456789.123
        XCTAssertEqual(json.rawString(), "123456789.123")
    }

    func testBool() {
        let json: JSON = true
        XCTAssertEqual(json.rawString(), "true")
    }

    func testNull() {
        let json: JSON = JSON.null
        XCTAssertEqual(json.rawString(), "null")
    }

    func testNestedJSON() {
        let inner: JSON = ["name": "john doe"]
        let json: JSON = ["level": 1337, "user": inner]
        let data: Data?
        do {
            data = try json.rawData()
        } catch _ {
            data = nil
        }
        let string = json.rawString()
        XCTAssertNotNil(data)
        XCTAssertNotNil(string)
    }
}
