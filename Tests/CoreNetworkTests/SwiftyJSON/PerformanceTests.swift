//
//  PerformanceTests.swift
//
//
//  Created by Pinglin Tang
//

import XCTest
@testable import CoreNetwork

class PerformanceTests : XCTestCase {

    var testData: Data!

    override func setUp() {
        super.setUp()
        if let file = Bundle.module.path(forResource: "Tests", ofType: "json") {
            self.testData = try? Data(contentsOf: URL(fileURLWithPath: file))
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitPerformance() {
        self.measure {
            for _ in 1...100 {
                guard let json = try? JSON(data: self.testData) else {
                    XCTFail("Unable to parse testData")
                    return
                }
                XCTAssertTrue(json != JSON.null)
            }
        }
    }

    func testObjectMethodPerformance() {
        guard let json = try? JSON(data: self.testData) else {
            XCTFail("Unable to parse testData")
            return
        }
        self.measure {
            for _ in 1...100 {
                let object: Any? = json.object
                XCTAssertTrue(object != nil)
            }
        }
    }

    func testArrayMethodPerformance() {
        guard let json = try? JSON(data: self.testData) else {
            XCTFail("Unable to parse testData")
            return
        }
        self.measure {
            for _ in 1...100 {
                autoreleasepool {
                    if let array = json.array {
                        XCTAssertTrue(array.count > 0)
                    }
                }
            }
        }
    }

    func testDictionaryMethodPerformance() {
        guard let json = try? JSON(data: self.testData)[0] else {
            XCTFail("Unable to parse testData")
            return
        }
        self.measure {
            for _ in 1...100 {
                autoreleasepool {
                    if let dictionary = json.dictionary {
                        XCTAssertTrue(dictionary.count > 0)
                    }
                }
            }
        }
    }

    func testRawStringMethodPerformance() {
        guard let json = try? JSON(data: self.testData) else {
            XCTFail("Unable to parse testData")
            return
        }
        self.measure {
            for _ in 1...100 {
                autoreleasepool {
                    let string = json.rawString()
                    XCTAssertTrue(string != nil)
                }
            }
        }
    }

    func testLargeDictionaryMethodPerformance() {
        var data: [String: JSON] = [:]
        (0...100000).forEach { n in
            data["\(n)"] = JSON([
                "name": "item\(n)",
                "id": n
                ])
        }
        let json = JSON(data)

        self.measure {
            autoreleasepool {
                if let dictionary = json.dictionary {
                    XCTAssertTrue(dictionary.count == 100001)
                } else {
                    XCTFail("dictionary should not be nil")
                }
            }
        }
    }
}
