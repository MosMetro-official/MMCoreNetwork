//
//  Test_Request.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import XCTest
@testable import CoreNetwork

class Test_Request : XCTestCase {
    
    func test_Init() {
        let req = Request(
            path: "path",
            body: ["test":"testing"],
            query: ["test":"testing"],
            method: .GET,
            contentType: .json
        )
        XCTAssertEqual(req.path, "path")
        XCTAssertEqual(req.body as! [String : String], ["test":"testing"])
        XCTAssertEqual(req.query, ["test":"testing"])
        XCTAssertEqual(req.method, .GET)
        XCTAssertEqual(req.contentType, .json)
        
        let req1 = Request(
            path: "path",
            query: ["test":"testing"],
            method: .POST,
            contentType: .formData
        )
        XCTAssertEqual(req1.path, "path")
        XCTAssertEqual(req1.query, ["test":"testing"])
        XCTAssertEqual(req1.method, .POST)
        XCTAssertEqual(req1.contentType, .formData)
        
        let req2 = Request(
            path: "path",
            body: ["test":"testing"],
            query: ["test":"testing"],
            method: .PUT,
            contentType: .other
        )
        XCTAssertEqual(req2.path, "path")
        XCTAssertEqual(req2.body as! [String : String], ["test":"testing"])
        XCTAssertEqual(req2.query, ["test":"testing"])
        XCTAssertEqual(req2.method, .PUT)
        XCTAssertEqual(req2.contentType, .other)
        
        let req3 = Request(
            path: "path",
            body: ["test":"testing"],
            method: .DELETE,
            contentType: .urlEncoded
        )
        XCTAssertEqual(req3.path, "path")
        XCTAssertEqual(req3.body as! [String : String], ["test":"testing"])
        XCTAssertEqual(req3.query, nil)
        XCTAssertEqual(req3.method, .DELETE)
        XCTAssertEqual(req3.contentType, .urlEncoded)
    }
    
    func test_GetFuncReturnGoodRequest() {
        let req = Request.GET(
            path: "path"
        )
        XCTAssertEqual(req.path, "path")
        XCTAssertEqual(req.query, nil)
        XCTAssertEqual(req.method, .GET)
        XCTAssertEqual(req.contentType, .json)
    }
    
    func test_PutFuncReturnGoodRequest() {
        let req = Request.PUT(
            path: "path"
        )
        XCTAssertEqual(req.path, "path")
        XCTAssertEqual(req.query, nil)
        XCTAssertEqual(req.method, .PUT)
        XCTAssertEqual(req.contentType, .json)
    }
    
    func test_PostFuncReturnGoodRequest() {
        let req = Request.POST(
            path: "path",
            contentType: .json
        )
        XCTAssertEqual(req.path, "path")
        XCTAssertEqual(req.query, nil)
        XCTAssertEqual(req.method, .POST)
        XCTAssertEqual(req.contentType, .json)
    }
    
    func test_DeleteFuncReturnGoodRequest() {
        let req = Request.DELETE(
            path: "path"
        )
        XCTAssertEqual(req.path, "path")
        XCTAssertEqual(req.query, nil)
        XCTAssertEqual(req.method, .DELETE)
        XCTAssertEqual(req.contentType, .json)
    }
}
