//
//  ComparableTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class ComparableTests : XCTestCase {
    
    func test_NumberEqual() {
        let jsonL1: JSON = 1234567890.876623
        let jsonR1: JSON = JSON(1234567890.876623)
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == 1234567890.876623)
        
        let jsonL2: JSON = 987654321
        let jsonR2: JSON = JSON(987654321)
        XCTAssertEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonR2 == 987654321)
        
        let jsonL3: JSON = JSON(NSNumber(value: 87654321.12345678))
        let jsonR3: JSON = JSON(NSNumber(value: 87654321.12345678))
        XCTAssertEqual(jsonL3, jsonR3)
        XCTAssertTrue(jsonR3 == 87654321.12345678)
    }
    
    func test_NumberNotEqual() {
        let jsonL1: JSON = 1234567890.876623
        let jsonR1: JSON = JSON(123.123)
        XCTAssertNotEqual(jsonL1, jsonR1)
        XCTAssertFalse(jsonL1 == 34343)
        
        let jsonL2: JSON = 8773
        let jsonR2: JSON = JSON(123.23)
        XCTAssertNotEqual(jsonL2, jsonR2)
        XCTAssertFalse(jsonR1 == 454352)
        
        let jsonL3: JSON = JSON(NSNumber(value: 87621.12345678))
        let jsonR3: JSON = JSON(NSNumber(value: 87654321.45678))
        XCTAssertNotEqual(jsonL3, jsonR3)
        XCTAssertFalse(jsonL3 == 4545.232)
    }
    
    func test_NumberGreaterThanOrEqual() {
        let jsonL1: JSON = 1234567890.876623
        let jsonR1: JSON = JSON(123.123)
        XCTAssertGreaterThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 >= -37434)
        
        let jsonL2: JSON = 8773
        let jsonR2: JSON = JSON(-87343)
        XCTAssertGreaterThanOrEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonR2 >= -988343)
        
        let jsonL3: JSON = JSON(NSNumber(value: 87621.12345678))
        let jsonR3: JSON = JSON(NSNumber(value: 87621.12345678))
        XCTAssertGreaterThanOrEqual(jsonL3, jsonR3)
        XCTAssertTrue(jsonR3 >= 0.3232)
    }
    
    func test_NumberLessThanOrEqual() {
        let jsonL1: JSON = 1234567890.876623
        let jsonR1: JSON = JSON(123.123)
        XCTAssertLessThanOrEqual(jsonR1, jsonL1)
        XCTAssertFalse(83487343.3493 <= jsonR1)
        
        let jsonL2: JSON = 8773
        let jsonR2: JSON = JSON(-123.23)
        XCTAssertLessThanOrEqual(jsonR2, jsonL2)
        XCTAssertFalse(9348343 <= jsonR2)
        
        let jsonL3: JSON = JSON(NSNumber(value: 87621.12345678))
        let jsonR3: JSON = JSON(NSNumber(value: 87621.12345678))
        XCTAssertLessThanOrEqual(jsonR3, jsonL3)
        XCTAssertTrue(87621.12345678 <= jsonR3)
    }
    
    func test_NumberGreaterThan() {
        let jsonL1: JSON = 1234567890.876623
        let jsonR1: JSON = JSON(123.123)
        XCTAssertGreaterThan(jsonL1, jsonR1)
        XCTAssertFalse(jsonR1 > 192388843.0988)
        
        let jsonL2: JSON = 8773
        let jsonR2: JSON = JSON(123.23)
        XCTAssertGreaterThan(jsonL2, jsonR2)
        XCTAssertFalse(jsonR2 > 877434)
        
        let jsonL3: JSON = JSON(NSNumber(value: 87621.12345678))
        let jsonR3: JSON = JSON(NSNumber(value: 87621.1234567))
        XCTAssertGreaterThan(jsonL3, jsonR3)
        XCTAssertFalse(-7799 > jsonR3)
    }
    
    func test_NumberLessThan() {
        let jsonL1: JSON = 1234567890.876623
        let jsonR1: JSON = JSON(123.123)
        XCTAssertLessThan(jsonR1, jsonL1)
        XCTAssertTrue(jsonR1 < 192388843.0988)
        
        let jsonL2: JSON = 8773
        let jsonR2: JSON = JSON(123.23)
        XCTAssertLessThan(jsonR2, jsonL2)
        XCTAssertTrue(jsonR2 < 877434)
        
        let jsonL3: JSON = JSON(NSNumber(value: 87621.12345678))
        let jsonR3: JSON = JSON(NSNumber(value: 87621.1234567))
        XCTAssertLessThan(jsonR3, jsonL3)
        XCTAssertTrue(-7799 < jsonR3)
    }
    
    func test_BoolEqual() {
        let jsonL1: JSON = true
        let jsonR1: JSON = JSON(true)
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == true)
        
        let jsonL2: JSON = false
        let jsonR2: JSON = JSON(false)
        XCTAssertEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonL2 == false)
    }
    
    func test_BoolNotEqual() {
        let jsonL1: JSON = true
        let jsonR1: JSON = JSON(false)
        XCTAssertNotEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != false)
        
        let jsonL2: JSON = false
        let jsonR2: JSON = JSON(true)
        XCTAssertNotEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonL2 != true)
    }
    
    func test_BoolGreaterThanOrEqual() {
        let jsonL1: JSON = true
        let jsonR1: JSON = JSON(true)
        XCTAssertGreaterThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 >= true)
        
        let jsonL2: JSON = false
        let jsonR2: JSON = JSON(false)
        XCTAssertGreaterThanOrEqual(jsonL2, jsonR2)
        XCTAssertFalse(jsonL2 >= true)
    }
    
    func test_BoolLessThanOrEqual() {
        let jsonL1: JSON = true
        let jsonR1: JSON = JSON(true)
        XCTAssertLessThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(true <= jsonR1)
        
        let jsonL2: JSON = false
        let jsonR2: JSON = JSON(false)
        XCTAssertLessThanOrEqual(jsonL2, jsonR2)
        XCTAssertFalse(jsonL2 <= true)
    }
    
    func test_BoolGreaterThan() {
        let jsonL1: JSON = true
        let jsonR1: JSON = JSON(true)
        XCTAssertFalse(jsonL1 > jsonR1)
        XCTAssertFalse(jsonL1 > true)
        XCTAssertFalse(jsonR1 > false)
        
        let jsonL2: JSON = false
        let jsonR2: JSON = JSON(false)
        XCTAssertFalse(jsonL2 > jsonR2)
        XCTAssertFalse(jsonL2 > false)
        XCTAssertFalse(jsonR2 > true)
        
        let jsonL3: JSON = true
        let jsonR3: JSON = JSON(false)
        XCTAssertFalse(jsonL3 > jsonR3)
        XCTAssertFalse(jsonL3 > false)
        XCTAssertFalse(jsonR3 > true)
        
        let jsonL4: JSON = false
        let jsonR4: JSON = JSON(true)
        XCTAssertFalse(jsonL4 > jsonR4)
        XCTAssertFalse(jsonL4 > false)
        XCTAssertFalse(jsonR4 > true)
    }
    
    func test_BoolLessThan() {
        let jsonL1: JSON = true
        let jsonR1: JSON = JSON(true)
        XCTAssertFalse(jsonL1 < jsonR1)
        XCTAssertFalse(jsonL1 < true)
        XCTAssertFalse(jsonR1 < false)
        
        let jsonL2: JSON = false
        let jsonR2: JSON = JSON(false)
        XCTAssertFalse(jsonL2 < jsonR2)
        XCTAssertFalse(jsonL2 < false)
        XCTAssertFalse(jsonR2 < true)
        
        let jsonL3: JSON = true
        let jsonR3: JSON = JSON(false)
        XCTAssertFalse(jsonL3 < jsonR3)
        XCTAssertFalse(jsonL3 < false)
        XCTAssertFalse(jsonR3 < true)
        
        let jsonL4: JSON = false
        let jsonR4: JSON = JSON(true)
        XCTAssertFalse(jsonL4 < jsonR4)
        XCTAssertFalse(jsonL4 < false)
        XCTAssertFalse(true < jsonR4)
    }
    
    func test_StringEqual() {
        let jsonL1: JSON = "abcdefg 123456789 !@#$%^&*()"
        let jsonR1: JSON = JSON("abcdefg 123456789 !@#$%^&*()")

        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == "abcdefg 123456789 !@#$%^&*()")
    }
    
    func test_StringNotEqual() {
        let jsonL1: JSON = "abcdefg 123456789 !@#$%^&*()"
        let jsonR1: JSON = JSON("-=[]\\\"987654321")

        XCTAssertNotEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != "not equal")
    }
    
    func test_StringGreaterThanOrEqual() {
        let jsonL1: JSON = "abcdefg 123456789 !@#$%^&*()"
        let jsonR1: JSON = JSON("abcdefg 123456789 !@#$%^&*()")

        XCTAssertGreaterThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 >= "abcdefg 123456789 !@#$%^&*()")

        let jsonL2: JSON = "z-+{}:"
        let jsonR2: JSON = JSON("a<>?:")
        XCTAssertGreaterThanOrEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonL2 >= "mnbvcxz")
    }
    
    func test_StringLessThanOrEqual() {
        let jsonL1: JSON = "abcdefg 123456789 !@#$%^&*()"
        let jsonR1: JSON = JSON("abcdefg 123456789 !@#$%^&*()")

        XCTAssertLessThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 <= "abcdefg 123456789 !@#$%^&*()")

        let jsonL2: JSON = "z-+{}:"
        let jsonR2: JSON = JSON("a<>?:")
        XCTAssertLessThanOrEqual(jsonR2, jsonL2)
        XCTAssertTrue("mnbvcxz" <= jsonL2)
    }
    
    func test_StringGreaterThan() {
        let jsonL1: JSON = "abcdefg 123456789 !@#$%^&*()"
        let jsonR1: JSON = JSON("abcdefg 123456789 !@#$%^&*()")

        XCTAssertFalse(jsonL1 > jsonR1)
        XCTAssertFalse(jsonL1 > "abcdefg 123456789 !@#$%^&*()")

        let jsonL2: JSON = "z-+{}:"
        let jsonR2: JSON = JSON("a<>?:")
        XCTAssertGreaterThan(jsonL2, jsonR2)
        XCTAssertFalse("87663434" > jsonL2)
    }
    
    func test_StringLessThan() {
        let jsonL1: JSON = "abcdefg 123456789 !@#$%^&*()"
        let jsonR1: JSON = JSON("abcdefg 123456789 !@#$%^&*()")

        XCTAssertFalse(jsonL1 < jsonR1)
        XCTAssertFalse(jsonL1 < "abcdefg 123456789 !@#$%^&*()")

        let jsonL2: JSON = "98774"
        let jsonR2: JSON = JSON("123456")
        XCTAssertLessThan(jsonR2, jsonL2)
        XCTAssertFalse(jsonL2 < "09")
    }
    
    func test_Nil() {
        let jsonL1: JSON = JSON.null
        let jsonR1: JSON = JSON(NSNull())
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != "123")
        XCTAssertFalse(jsonL1 > "abcd")
        XCTAssertFalse(jsonR1 < "*&^")
        XCTAssertFalse(jsonL1 >= "jhfid")
        XCTAssertFalse(jsonR1 <= "你好")
        XCTAssertTrue(jsonL1 >= jsonR1)
        XCTAssertTrue(jsonL1 <= jsonR1)
    }
    
    func test_Array() {
        let jsonL1: JSON = [1, 2, "4", 5, "6"]
        let jsonR1: JSON = JSON([1, 2, "4", 5, "6"])
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == [1, 2, "4", 5, "6"])
        XCTAssertTrue(jsonL1 != ["abcd", "efg"])
        XCTAssertTrue(jsonL1 >= jsonR1)
        XCTAssertTrue(jsonL1 <= jsonR1)
        XCTAssertFalse(jsonL1 > ["abcd", ""])
        XCTAssertFalse(jsonR1 < [])
        XCTAssertFalse(jsonL1 >= [:])
    }
    
    func test_Dictionary() {
        let jsonL1: JSON = ["2": 2, "name": "Jack", "List": ["a", 1.09, NSNull()]]
        let jsonR1: JSON = JSON(["2": 2, "name": "Jack", "List": ["a", 1.09, NSNull()]])

        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != ["1": 2, "Hello": "World", "Koo": "Foo"])
        XCTAssertTrue(jsonL1 >= jsonR1)
        XCTAssertTrue(jsonL1 <= jsonR1)
        XCTAssertFalse(jsonL1 >= [:])
        XCTAssertFalse(jsonR1 <= ["999": "aaaa"])
        XCTAssertFalse(jsonL1 > [")(*&^": 1234567])
        XCTAssertFalse(jsonR1 < ["MNHH": "JUYTR"])
    }
}
