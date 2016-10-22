//
//  YXGesturesView.swift
//  YXGestures
//
//  Created by YourtionGuo on 12/10/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import Foundation

public protocol YXGesturesViewDelegate {
    func gesturesResult(string:String)
}

public class YXGesturesView: UIView {
    
    open var delegate:YXGesturesViewDelegate?
    
    open let gestures = YXGestures()
    open var lineColor = UIColor.black
    open var lineWidth = 1
    open var showPath = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        if (showPath) {
            let ctx = UIGraphicsGetCurrentContext()
            let path = CGMutablePath();
            for point in gestures.points {
                if (point == gestures.points.first) {
                    path.move(to: point, transform: .identity)
                }else{
                    path.addLine(to: point)
                }
            }
            ctx?.setStrokeColor(lineColor.cgColor)
            ctx?.setLineWidth(CGFloat(lineWidth))
            ctx?.addPath(path);
            ctx?.strokePath();
        }
    }
    
    public func getResult() -> String {
        return gestures.getResult()
    }
    
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
                self.setNeedsDisplay()
            }
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self))
                self.setNeedsDisplay()
                print(gestures.points)
                let result = gestures.getResult()
                print(result)
                if((delegate) != nil){
                    delegate?.gesturesResult(string: result)
                }
            }
        }
        
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        gestures.points.removeAll()
    }
    
}
