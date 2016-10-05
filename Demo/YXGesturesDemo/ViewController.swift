//
//  ViewController.swift
//  YXGesturesDemo
//
//  Created by YourtionGuo on 27/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import UIKit
import YXGestures

class ViewController: UIViewController {
    
    let gestures = YXGestures()

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
            if let t = touches.first {
                gestures.points.removeAll()
                gestures.points.append(t.location(in: self.view))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self.view))
            }
        }
        
        
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print(t.location(in: self.view))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event end!")
        if touches.count == 1 {
            if let t = touches.first {
                gestures.points.append(t.location(in: self.view))
                print(gestures.points)
                print(gestures.getResult())
            }
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event canceled!")
    }


}

