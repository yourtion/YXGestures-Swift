//
//  YXGestures.swift
//  YXGestures
//
//  Created by YourtionGuo on 27/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import Foundation

public class YXGestures {
    let MIN_DIS : CGFloat = 30
    let MIN_SCORE : Float = 0.4
    
    let symbol = ["28", "46", "141", "585"]
    let symbolG = ["V", "V", "Z", "Z"]
    
    open var points : Array<CGPoint> = []
    private let utils = YXGUtils()
    
    public init() {
        
    }
    
    public func getResult() -> String {
        let ponits1 = motion(points: self.points)
        print(ponits1)
        let dirs = parseDirection(points: ponits1)
        print(dirs)
        let str = repeatDiff(dirs: dirs)
        print(str)
        let res = sweep(str: str)
        print(res)
        return res
    }
    
    private func motion(points: Array<CGPoint>) -> Array<CGPoint> {
        var res : Array<CGPoint> = []
        var currentIndex = 0
        let len = points.count - 1
        for i in 0...len {
            let p1:CGPoint = points[i]
            let p2:CGPoint = points[currentIndex]
            let distance = utils.distance(p1: p1, p2: p2)
            if distance > MIN_DIS  {
                currentIndex = i
                res.append(p1)
            }
        }
        
        return res;
    }
    
    
    private func parseDirection(points: Array<CGPoint>) -> Array<Int> {
        var res : Array<Int> = []
        let len = points.count - 2
        for i in 0...len {
            let p1:CGPoint = points[i]
            let p2:CGPoint = points[i+1]
            let a = p1.y - p2.y
            let b = utils.distance(p1: p1, p2: p2)
            let rad = asin( a/b )
            let ang = rad * 57.2957800; // rad * 180/Math.PI
            let quad = self.quadrant(p1: p1, p2: p2)
            let dir = self.getDirByAngQuad(ang: ang, quad: quad)
            res.append(dir);
        }
        
        return res
    }
    
    private func repeatDiff(dirs: Array<Int>) -> String {
        var str_arr: Array<Int> = []
        var currentType = -1
        for dir in dirs {
            if(dir != currentType) {
                str_arr.append(dir)
                currentType = dir
            }
        }
        return str_arr.map({"\($0)"}).joined(separator: "")
    }
    
    private func quadrant(p1: CGPoint,p2:CGPoint) -> Int {
        if(p2.x>=p1.x) {
            if( p2.y <= p1.y ) {
                return 1;
            } else {
                return 4;
            }
        } else {
            if( p2.y <= p1.y ) {
                return 2;
            } else {
                return 3;
            }
        }
    }
    
    private func getDirByAngQuad(ang: CGFloat,quad: Int) -> Int {
        switch(quad) {
        case 1:
            if( ang <= 22.5 && ang >= 0 ) {
                return 1;
            }
            else if( ang <= 67.5 && ang > 22.5 ) {
                return 8;
            } else {
                return 7;
            }
        case 2:
            if( ang <= 22.5 && ang >= 0 ) {
                return 5;
            } else if( ang <= 67.5 && ang > 22.5 ) {
                return 6;
            } else {
                return 7;
            }
        case 3:
            if( ang <= -67.5 && ang >= -90 ) {
                return 3;
            } else if( ang <= -22.5 && ang > -67.5 ) {
                return 4;
            } else {
                return 5;
            }
        case 4:
            if( ang <= -67.5 && ang >= -90 ) {
                return 3;
            } else if( ang <= -22.5 && ang > -67.5) {
                return 2;
            } else {
                return 1;
            }
        default:
            return 0
        }
        
    }
    
    private func sweep( str:String ) -> String {
        var maxType: String = ""
        var max: Float = -1
        let len = self.symbol.count - 1
        for i in 0...len {
            let val = self.levenshteinDistancePercent(s: self.symbol[i], t: str)
            if val > max {
                max = val;
                maxType = self.symbolG[i];
            }
        }
        print(max)
        if max < MIN_SCORE {
            maxType = ""
        }
        return maxType;
    }
    
    private func  levenshteinDistancePercent(s:String, t:String) -> Float {
        let l = Float(s.characters.count > t.characters.count ? s.characters.count : t.characters.count)
        let d = Float(self.levenshteinDistance(s: s, t: t))
        return ( 1.0 - d / l ) //.toFixed(4)
    }
    
    private func levenshteinDistance(s:String, t:String) -> Int {
        let n = s.characters.count // length of s
        let m = t.characters.count // length of t
        var d: Array<Array<Int>> = [[]] // matrix
        var s_i = "" // ith character of s
        var t_j = "" // jth character of t
        var cost = 0
        if n == 0 { return m }
        if m == 0 { return n }
        
        for i in 0...n {
            d.append([i])
            for j in 0...m{
                d[i].append(j)
            }
        }
        
        for i in 1...n {
            s_i = s.charAt(i: i-1)
            for j in 1...m {
                t_j = t.charAt(i: j - 1)
                if (s_i == t_j) {
                    cost = 0
                }else{
                    cost = 1
                }
                d[i][j] = utils.minimum(a: d[i-1][j]+1, b: d[i][j-1]+1, c: d[i-1][j-1] + cost)
            }
        }
        return d[n][m]
    }
    
}
