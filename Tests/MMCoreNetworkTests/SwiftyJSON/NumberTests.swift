//
//  NumberTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class NumberTests : XCTestCase {

    func testNumber() {
        //getter
        var json = JSON(NSNumber(value: 9876543210.123456789))
        XCTAssertEqual(json.number!, 9876543210.123456789)
        XCTAssertEqual(json.numberValue, 9876543210.123456789)
        XCTAssertEqual(json.stringValue, "9876543210.123457")

        json.string = "1000000000000000000000000000.1"
        XCTAssertNil(json.number)
        XCTAssertEqual(json.numberValue.description, "1000000000000000000000000000.1")

        json.string = "1e+27"
        XCTAssertEqual(json.numberValue.description, "1000000000000000000000000000")

        //setter
        json.number = NSNumber(value: 123456789.0987654321)
        XCTAssertEqual(json.number!, 123456789.0987654321)
        XCTAssertEqual(json.numberValue, 123456789.0987654321)

        json.number = nil
        XCTAssertEqual(json.numberValue, 0)
        XCTAssertEqual(json.object as? NSNull, NSNull())
        XCTAssertTrue(json.number == nil)

        json.numberValue = 2.9876
        XCTAssertEqual(json.number!, 2.9876)
    }

    func testBool() {
        var json = JSON(true)
        XCTAssertEqual(json.bool!, true)
        XCTAssertEqual(json.boolValue, true)
        XCTAssertEqual(json.numberValue, true as NSNumber)
        XCTAssertEqual(json.stringValue, "true")

        json.bool = false
        XCTAssertEqual(json.bool!, false)
        XCTAssertEqual(json.boolValue, false)
        XCTAssertEqual(json.numberValue, false as NSNumber)

        json.bool = nil
        XCTAssertTrue(json.bool == nil)
        XCTAssertEqual(json.boolValue, false)
        XCTAssertEqual(json.numberValue, 0)

        json.boolValue = true
        XCTAssertEqual(json.bool!, true)
        XCTAssertEqual(json.boolValue, true)
        XCTAssertEqual(json.numberValue, true as NSNumber)
    }

    func testDouble() {
        var json = JSON(9876543210.123456789)
        XCTAssertEqual(json.double!, 9876543210.123456789)
        XCTAssertEqual(json.doubleValue, 9876543210.123456789)
        XCTAssertEqual(json.numberValue, 9876543210.123456789)
        XCTAssertEqual(json.stringValue, "9876543210.123457")

        json.double = 2.8765432
        XCTAssertEqual(json.double!, 2.8765432)
        XCTAssertEqual(json.doubleValue, 2.8765432)
        XCTAssertEqual(json.numberValue, 2.8765432)

        json.doubleValue = 89.0987654
        XCTAssertEqual(json.double!, 89.0987654)
        XCTAssertEqual(json.doubleValue, 89.0987654)
        XCTAssertEqual(json.numberValue, 89.0987654)

        json.double = nil
        XCTAssertEqual(json.boolValue, false)
        XCTAssertEqual(json.doubleValue, 0.0)
        XCTAssertEqual(json.numberValue, 0)
    }

    func testFloat() {
        var json = JSON(54321.12345)
        XCTAssertTrue(json.float! == 54321.12345)
        XCTAssertTrue(json.floatValue == 54321.12345)
        XCTAssertEqual(json.numberValue, 54321.12345)
        XCTAssertEqual(json.stringValue, "54321.12345")

        json.double = 23231.65
        XCTAssertTrue(json.float! == 23231.65)
        XCTAssertTrue(json.floatValue == 23231.65)
        XCTAssertEqual(json.numberValue, NSNumber(value: 23231.65))

        json.double = -98766.23
        XCTAssertEqual(json.float!, -98766.23)
        XCTAssertEqual(json.floatValue, -98766.23)
        XCTAssertEqual(json.numberValue, NSNumber(value: -98766.23))
    }

    func testInt() {
        var json = JSON(123456789)
        XCTAssertEqual(json.int!, 123456789)
        XCTAssertEqual(json.intValue, 123456789)
        XCTAssertEqual(json.numberValue, NSNumber(value: 123456789))
        XCTAssertEqual(json.stringValue, "123456789")

        json.int = nil
        XCTAssertTrue(json.boolValue == false)
        XCTAssertTrue(json.intValue == 0)
        XCTAssertEqual(json.numberValue, 0)
        XCTAssertEqual(json.object as? NSNull, NSNull())
        XCTAssertTrue(json.int == nil)

        json.intValue = 76543
        XCTAssertEqual(json.int!, 76543)
        XCTAssertEqual(json.intValue, 76543)
        XCTAssertEqual(json.numberValue, NSNumber(value: 76543))

        json.intValue = 98765421
        XCTAssertEqual(json.int!, 98765421)
        XCTAssertEqual(json.intValue, 98765421)
        XCTAssertEqual(json.numberValue, NSNumber(value: 98765421))
    }
}
