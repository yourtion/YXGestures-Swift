//
//  YXGUtilsTest.swift
//  YXGestures
//
//  Created by YourtionGuo on 28/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import XCTest
@testable import YXGestures

class YXGUtilsTests: XCTestCase {
    
    let utils = YXGUtils()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDistance() {
        let res1 = utils.distance(p1: CGPoint(x:0, y:0), p2: CGPoint(x:3, y:4))
        XCTAssertEqual(5, res1)
        
        let res2 = utils.distance(p1: CGPoint(x:-3, y:-4), p2: CGPoint(x:0, y:0))
        XCTAssertEqual(5, res2)
        
        let res3 = utils.distance(p1: CGPoint(x:-3, y:-4), p2: CGPoint(x:3, y:4))
        XCTAssertEqual(10, res3)
    }
    
    func testMinimum() {
        let res1 = utils.minimum(a: 0, b: 1, c: 2)
        XCTAssertEqual(0, res1)
        
        let res2 = utils.minimum(a: 1, b: 1, c: 1)
        XCTAssertEqual(1, res2)
        
        let res3 = utils.minimum(a: 2, b: 0, c: -1)
        XCTAssertEqual(-1, res3)
        
        let res4 = utils.minimum(a: -5, b: -1, c: -8)
        XCTAssertEqual(-8, res4)
        
        let res5 = utils.minimum(a: -0, b: 1, c: -2)
        XCTAssertEqual(-2, res5)
    }
    
}
