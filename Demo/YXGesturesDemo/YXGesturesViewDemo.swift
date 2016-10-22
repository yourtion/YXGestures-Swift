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
    
    let gView = YXGesturesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gView.frame = self.view.frame
        self.view.addSubview(gView)
        
//        gView.showPath = false
        gView.lineWidth = 5
        gView.lineColor = UIColor.blue
        gView.gestures.addSymbol(symbol: "V", code: 28)
        gView.gestures.addSymbol(symbol: "V", code: 46)
        gView.gestures.addSymbol(symbol: "Z", code: 141)
        gView.gestures.addSymbol(symbol: "Z", code: 585)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

