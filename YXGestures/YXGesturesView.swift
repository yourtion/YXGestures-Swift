//
//  YXGesturesView.swift
//  YXGestures
//
//  Created by YourtionGuo on 12/10/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import Foundation

class YXGesturesView: UIView {
    
    let gestures = YXGestures()
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event begin!")
        
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.removeAll()
                gestures.points.append(t.location(in: self))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self))
                print(gestures.points)
                print(gestures.getResult())
            }
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        gestures.points.removeAll()
    }
}
