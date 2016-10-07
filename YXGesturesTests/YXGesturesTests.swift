//
//  YXGesturesTests.swift
//  YXGesturesTests
//
//  Created by YourtionGuo on 27/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import XCTest
@testable import YXGestures

class YXGesturesTests: XCTestCase {
    
    let gestures = YXGestures()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddSymbole() {
        let count1 = gestures.symbol.count
        let count2 = gestures.symbolCode.count
        
        XCTAssertEqual(count1, count2)
        
        gestures.addSymbol(symbol: "V", code: "28")
        XCTAssertEqual(gestures.symbol.count, count1 + 1)
        XCTAssertEqual(gestures.symbolCode.count, count2 + 1)
        XCTAssertEqual(count1, count2)
        
        gestures.addSymbol(symbol: "V", code: "46")
        XCTAssertEqual(gestures.symbol.count, count1 + 2)
        XCTAssertEqual(gestures.symbolCode.count, count2 + 2)
        XCTAssertEqual(count1, count2)
    }
    
}
