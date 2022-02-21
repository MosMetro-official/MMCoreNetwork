//
//  PrintableTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class PrintableTests : XCTestCase {
    func testNumber() {
        let json: JSON = 1234567890.876623
        XCTAssertEqual(json.description, "1234567890.876623")
        XCTAssertEqual(json.debugDescription, "1234567890.876623")
    }

    func testBool() {
        let jsonTrue: JSON = true
        XCTAssertEqual(jsonTrue.description, "true")
        XCTAssertEqual(jsonTrue.debugDescription, "true")
        let jsonFalse: JSON = false
        XCTAssertEqual(jsonFalse.description, "false")
        XCTAssertEqual(jsonFalse.debugDescription, "false")
    }

    func testString() {
        let json: JSON = "abcd efg, HIJK;LMn"
        XCTAssertEqual(json.description, "abcd efg, HIJK;LMn")
        XCTAssertEqual(json.debugDescription, "abcd efg, HIJK;LMn")
    }

    func testNil() {
        let jsonNil_1: JSON = JSON.null
        XCTAssertEqual(jsonNil_1.description, "null")
        XCTAssertEqual(jsonNil_1.debugDescription, "null")
        let jsonNil_2: JSON = JSON(NSNull())
        XCTAssertEqual(jsonNil_2.description, "null")
        XCTAssertEqual(jsonNil_2.debugDescription, "null")
    }

    func testArray() {
        let json: JSON = [1, 2, "4", 5, "6"]
        var description = json.description.replacingOccurrences(of: "\n", with: "")
        description = description.replacingOccurrences(of: " ", with: "")
        XCTAssertEqual(description, "[1,2,\"4\",5,\"6\"]")
        XCTAssertTrue(json.description.lengthOfBytes(using: String.Encoding.utf8) > 0)
        XCTAssertTrue(json.debugDescription.lengthOfBytes(using: String.Encoding.utf8) > 0)
    }

    func testArrayWithStrings() {
        let array = ["\"123\""]
        let json = JSON(array)
        var description = json.description.replacingOccurrences(of: "\n", with: "")
        description = description.replacingOccurrences(of: " ", with: "")
        XCTAssertEqual(description, "[\"\\\"123\\\"\"]")
        XCTAssertTrue(json.description.lengthOfBytes(using: String.Encoding.utf8) > 0)
        XCTAssertTrue(json.debugDescription.lengthOfBytes(using: String.Encoding.utf8) > 0)
    }

    func testArrayWithOptionals() {
        let array = [1, 2, "4", 5, "6", nil] as [Any?]
        let json = JSON(array)
		guard var description = json.rawString([.castNilToNSNull: true]) else {
			XCTFail("could not represent array")
			return
		}
		description = description.replacingOccurrences(of: "\n", with: "")
        description = description.replacingOccurrences(of: " ", with: "")
        XCTAssertEqual(description, "[1,2,\"4\",5,\"6\",null]")
        XCTAssertTrue(json.description.lengthOfBytes(using: String.Encoding.utf8) > 0)
        XCTAssertTrue(json.debugDescription.lengthOfBytes(using: String.Encoding.utf8) > 0)
    }

    func testDictionary() {
        let json: JSON = ["1": 2, "2": "two", "3": 3]
        var debugDescription = json.debugDescription.replacingOccurrences(of: "\n", with: "")
        debugDescription = debugDescription.replacingOccurrences(of: " ", with: "")
        XCTAssertTrue(json.description.lengthOfBytes(using: String.Encoding.utf8) > 0)
        XCTAssertTrue(debugDescription.range(of: "\"1\":2", options: String.CompareOptions.caseInsensitive) != nil)
        XCTAssertTrue(debugDescription.range(of: "\"2\":\"two\"", options: String.CompareOptions.caseInsensitive) != nil)
        XCTAssertTrue(debugDescription.range(of: "\"3\":3", options: String.CompareOptions.caseInsensitive) != nil)
    }

    func testDictionaryWithStrings() {
        let dict = ["foo": "{\"bar\":123}"] as [String: Any]
        let json = JSON(dict)
        var debugDescription = json.debugDescription.replacingOccurrences(of: "\n", with: "")
        debugDescription = debugDescription.replacingOccurrences(of: " ", with: "")
        XCTAssertTrue(json.description.lengthOfBytes(using: String.Encoding.utf8) > 0)
        let exceptedResult = "{\"foo\":\"{\\\"bar\\\":123}\"}"
        XCTAssertEqual(debugDescription, exceptedResult)
    }

    func testDictionaryWithOptionals() {
        let dict = ["1": 2, "2": "two", "3": nil] as [String: Any?]
        let json = JSON(dict)
		guard var description = json.rawString([.castNilToNSNull: true]) else {
			XCTFail("could not represent dictionary")
			return
		}
		description = description.replacingOccurrences(of: "\n", with: "")
        description = description.replacingOccurrences(of: " ", with: "")
        XCTAssertTrue(json.description.lengthOfBytes(using: String.Encoding.utf8) > 0)
        XCTAssertTrue(description.range(of: "\"1\":2", options: NSString.CompareOptions.caseInsensitive) != nil)
        XCTAssertTrue(description.range(of: "\"2\":\"two\"", options: NSString.CompareOptions.caseInsensitive) != nil)
        XCTAssertTrue(description.range(of: "\"3\":null", options: NSString.CompareOptions.caseInsensitive) != nil)
    }
}
