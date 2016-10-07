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
    
    func testStringExtension() {
        let str = "Yourtion"
        
        XCTAssertEqual("Y", str.charAt(i: 0))
        XCTAssertEqual("o", str.charAt(i: 1))
        XCTAssertEqual("u", str.charAt(i: 2))
        XCTAssertEqual("r", str.charAt(i: 3))
        XCTAssertEqual("t", str.charAt(i: 4))
        XCTAssertEqual("i", str.charAt(i: 5))
        XCTAssertEqual("o", str.charAt(i: 6))
        XCTAssertEqual("n", str.charAt(i: 7))
        
        XCTAssertEqual("", str.charAt(i: 8))
        
        XCTAssertEqual("", str.charAt(i: -1))
    }
    
}
