//
//  ArrayTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class ArrayTests : XCTestCase {
    
    func test_SingleDimensionalArraysGetter() {
        let array = ["1", "2", "a", "B", "D"]
        let json = JSON(array)
        XCTAssertEqual((json.array![0] as JSON).string!, "1")
        XCTAssertEqual((json.array![1] as JSON).string!, "2")
        XCTAssertEqual((json.array![2] as JSON).string!, "a")
        XCTAssertEqual((json.array![3] as JSON).string!, "B")
        XCTAssertEqual((json.array![4] as JSON).string!, "D")
    }
    
    func test_SingleDimensionalArraysSetter() {
        let array = ["1", "2", "a", "B", "D"]
        var json = JSON(array)
        json.arrayObject = ["111", "222"]
        XCTAssertEqual((json.array![0] as JSON).string!, "111")
        XCTAssertEqual((json.array![1] as JSON).string!, "222")
    }
}
