//
//  YXGUtils.swift
//  YXGestures
//
//  Created by YourtionGuo on 27/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import Foundation

extension String {
    func charAt(i: Int) -> String {
        if i < 0  { return "" }
        if i >= self.characters.count { return "" }
        let index = self.index(self.startIndex, offsetBy: i)
        return String(self.characters[index])
    }
}

class YXGUtils {
    
    public func distance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        return sqrt(pow(p2.x-p1.x,2)+pow(p2.y-p1.y,2))
    }
    
    public func minimum(a:Int,b:Int,c:Int) -> Int {
        return a < b ? (a < c ? a : c) : (b < c ? b : c)
    }
}
