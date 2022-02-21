//
//  MergeTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class MergeTests : XCTestCase {
    
    func test_DifferingTypes() {
        let A = JSON("a")
        let B = JSON(1)
        do {
            _ = try A.merged(with: B)
        } catch let error as SwiftyJSONError {
            XCTAssertEqual(error.errorCode, SwiftyJSONError.wrongType.rawValue)
            XCTAssertEqual(type(of: error).errorDomain, SwiftyJSONError.errorDomain)
            XCTAssertEqual(error.errorUserInfo as! [String: String], [NSLocalizedDescriptionKey: "Couldn't merge, because the JSONs differ in type on top level."])
        } catch _ {}
    }
    
    func test_PrimitiveType() {
        let A = JSON("a")
        let B = JSON("b")
        XCTAssertEqual(try! A.merged(with: B), B)
    }
    
    func test_MergeEqual() {
        let json = JSON(["a": "A"])
        XCTAssertEqual(try! json.merged(with: json), json)
    }
    
    func test_MergeUnequalValues() {
        let A = JSON(["a": "A"])
        let B = JSON(["a": "B"])
        XCTAssertEqual(try! A.merged(with: B), B)
    }
    
    func test_MergeUnequalKeysAndValues() {
        let A = JSON(["a": "A"])
        let B = JSON(["b": "B"])
        XCTAssertEqual(try! A.merged(with: B), JSON(["a": "A", "b": "B"]))
    }
    
    func test_MergeFilledAndEmpty() {
        let A = JSON(["a": "A"])
        let B = JSON([:])
        XCTAssertEqual(try! A.merged(with: B), A)
    }
    
    func test_MergeEmptyAndFilled() {
        let A = JSON([:])
        let B = JSON(["a": "A"])
        XCTAssertEqual(try! A.merged(with: B), B)
    }
    
    func test_MergeArray() {
        let A = JSON(["a"])
        let B = JSON(["b"])
        XCTAssertEqual(try! A.merged(with: B), JSON(["a", "b"]))
    }
    
    func test_MergeNestedJSONs() {
        let A = JSON([
            "nested": [
                "A": "a"
            ]
        ])
        let B = JSON([
            "nested": [
                "A": "b"
            ]
        ])
        XCTAssertEqual(try! A.merged(with: B), B)
    }
}
