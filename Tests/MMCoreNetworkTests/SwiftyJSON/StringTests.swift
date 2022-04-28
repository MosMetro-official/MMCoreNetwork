//
//  StringTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class StringTests : XCTestCase {

    func testString() {
        //getter
        var json = JSON("abcdefg hijklmn;opqrst.?+_()")
        XCTAssertEqual(json.string!, "abcdefg hijklmn;opqrst.?+_()")
        XCTAssertEqual(json.stringValue, "abcdefg hijklmn;opqrst.?+_()")

        json.string = "12345?67890.@#"
        XCTAssertEqual(json.string!, "12345?67890.@#")
        XCTAssertEqual(json.stringValue, "12345?67890.@#")
    }

    func testUrl() {
        let json = JSON("http://github.com")
        XCTAssertEqual(json.url!, URL(string: "http://github.com")!)
    }

    func testBool() {
        let json = JSON("true")
        XCTAssertTrue(json.boolValue)
    }

    func testBoolWithY() {
        let json = JSON("Y")
        XCTAssertTrue(json.boolValue)
    }

    func testBoolWithT() {
        let json = JSON("T")
        XCTAssertTrue(json.boolValue)
    }

    func testBoolWithYes() {
        let json = JSON("Yes")
        XCTAssertTrue(json.boolValue)
    }

    func testBoolWith1() {
        let json = JSON("1")
        XCTAssertTrue(json.boolValue)
    }

    func testUrlPercentEscapes() {
        let emDash = "\\u2014"
        let urlString = "http://examble.com/unencoded" + emDash + "string"
        guard let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return XCTFail("Couldn't encode URL string \(urlString)")
        }
        let json = JSON(urlString)
        XCTAssertEqual(json.url!, URL(string: encodedURLString)!, "Wrong unpacked ")
        let preEscaped = JSON(encodedURLString)
        XCTAssertEqual(preEscaped.url!, URL(string: encodedURLString)!, "Wrong unpacked ")
    }
}
