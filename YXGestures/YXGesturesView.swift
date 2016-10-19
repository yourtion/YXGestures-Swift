//
//  YXGesturesView.swift
//  YXGestures
//
//  Created by YourtionGuo on 12/10/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import Foundation

public class YXGesturesView: UIView {
    
    open let gestures = YXGestures()
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.removeAll()
                gestures.points.append(t.location(in: self))
            }
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self))
            }
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self))
                print(gestures.points)
                print(gestures.getResult())
            }
        }
        
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        gestures.points.removeAll()
    }
}
