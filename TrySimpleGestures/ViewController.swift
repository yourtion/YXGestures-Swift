//
//  ViewController.swift
//  TrySimpleGestures
//
//  Created by YourtionGuo on 26/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            //当在屏幕上连续拍动两下时，背景恢复为白色
            if(t.tapCount == 2)
            {
                self.view.backgroundColor = UIColor.white
            }
                //当在屏幕上单击时，屏幕变为红色
            else if(t.tapCount == 1)
            {
                self.view.backgroundColor = UIColor.red
            }
            print("event begin!")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let t:UITouch = touch as! UITouch
            print(t.location(in: self.view))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //两点触摸时，计算两点间的距离，以及角度
        if touches.count == 2{
            //获取触摸点
            let first = (touches as NSSet).allObjects[0] as! UITouch
            let second = (touches as NSSet).allObjects[1] as! UITouch
            //获取触摸点坐标
            let firstPoint = first.location(in: self.view)
            let secondPoint = second.location(in: self.view)
            //计算两点间的距离
            let deltaX = secondPoint.x - firstPoint.x
            let deltaY = secondPoint.y - firstPoint.y
            let initialDistance = sqrt(deltaX*deltaX + deltaY*deltaY)
            print("两点间距离：\(initialDistance)")
            //计算两点间的角度
            let height = secondPoint.y - firstPoint.y
            let width = firstPoint.x - secondPoint.x
            let rads = atan(height/width);
            let degrees = 180.0 * Double(rads) / M_PI
            print("两点间角度：\(degrees)")
        }
        print("event end!")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event canceled!")
    }


}

