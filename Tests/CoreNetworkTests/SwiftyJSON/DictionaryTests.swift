//
//  DictionaryTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class DictionaryTests : XCTestCase {
    
    func test_Getter() {
        let dictionary = ["number": 9823.212, "name": "NAME", "list": [1234, 4.212], "object": ["sub_number": 877.2323, "sub_name": "sub_name"], "bool": true] as [String: Any]
        let json = JSON(dictionary)
        //dictionary
        XCTAssertEqual((json.dictionary!["number"]! as JSON).double!, 9823.212)
        XCTAssertEqual((json.dictionary!["name"]! as JSON).string!, "NAME")
        XCTAssertEqual(((json.dictionary!["list"]! as JSON).array![0] as JSON).int!, 1234)
        XCTAssertEqual(((json.dictionary!["list"]! as JSON).array![1] as JSON).double!, 4.212)
        XCTAssertEqual((((json.dictionary!["object"]! as JSON).dictionaryValue)["sub_number"]! as JSON).double!, 877.2323)
        XCTAssertTrue(json.dictionary!["null"] == nil)
        //dictionaryValue
        XCTAssertEqual(((((json.dictionaryValue)["object"]! as JSON).dictionaryValue)["sub_name"]! as JSON).string!, "sub_name")
        XCTAssertEqual((json.dictionaryValue["bool"]! as JSON).bool!, true)
        XCTAssertTrue(json.dictionaryValue["null"] == nil)
        XCTAssertTrue(JSON.null.dictionaryValue == [:])
        //dictionaryObject
        XCTAssertEqual(json.dictionaryObject!["number"]! as? Double, 9823.212)
        XCTAssertTrue(json.dictionaryObject!["null"] == nil)
        XCTAssertTrue(JSON.null.dictionaryObject == nil)
    }
    
    func test_Setter() {
        var json: JSON = ["test": "case"]
        XCTAssertEqual(json.dictionaryObject! as! [String: String], ["test": "case"])
        json.dictionaryObject = ["name": "NAME"]
        XCTAssertEqual(json.dictionaryObject! as! [String: String], ["name": "NAME"])
    }
}
