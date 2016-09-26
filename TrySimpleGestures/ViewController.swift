//
//  ViewController.swift
//  TrySimpleGestures
//
//  Created by YourtionGuo on 26/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let MIN_DIS : CGFloat = 30
    
    private var points : Array<CGPoint> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event begin!")
        
        if touches.count == 1 {
            guard let t = touches.first else { return }
            self.points.removeAll()
            self.points.append(t.location(in: self.view))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            guard let t = touches.first else { return }
            self.points.append(t.location(in: self.view))
        }
        
        
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print(t.location(in: self.view))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event end!")
        if touches.count == 1 {
            guard let t = touches.first else { return }
            self.points.append(t.location(in: self.view))
            print(self.points)
            print(motion(points: self.points))
        }

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event canceled!")
    }
    
    private func distance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        return sqrt(pow(p2.x-p1.x,2)+pow(p2.y-p1.y,2))
    }
    
    private func motion(points: Array<CGPoint>) -> Array<CGPoint> {
        var res : Array<CGPoint> = []
        var currentIndex = 0
        let len = points.count - 1
        for i in 0...len {
            let p1:CGPoint = points[i]
            let p2:CGPoint = points[currentIndex]
            let distance = self.distance(p1: p1, p2: p2)
            if distance > MIN_DIS  {
                currentIndex = i;
                res.append(p1);
            }
        }
        
        return res;
    }
    
    
}

