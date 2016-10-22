//
//  ViewController.swift
//  YXGesturesDemo
//
//  Created by YourtionGuo on 27/09/2016.
//  Copyright © 2016 YourtionGuo. All rights reserved.
//

import UIKit
import YXGestures

class ViewController: UIViewController,YXGesturesViewDelegate {
    
    let gView = YXGesturesView()
    let textLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textLable.frame = CGRect(x: 100, y: 100, width: self.view.frame.width-200, height: self.view.frame.height-200)
        textLable.font = UIFont.boldSystemFont(ofSize: 100)
        textLable.textAlignment = .center
        
        gView.frame = self.view.frame
        gView.delegate = self
        self.view.addSubview(textLable)
        self.view.addSubview(gView)
        
//        gView.showPath = false
        gView.lineWidth = 5
        gView.lineColor = UIColor.blue
        
        gView.gestures.addSymbol(symbol: "V", code: 28)
        gView.gestures.addSymbol(symbol: "V", code: 46)
        gView.gestures.addSymbol(symbol: "Z", code: 141)
        gView.gestures.addSymbol(symbol: "Z", code: 585)
        
        gView.gestures.addSymbol(symbol: "S", code: 543235)
        gView.gestures.addSymbol(symbol: "<", code: 54321)
        gView.gestures.addSymbol(symbol: "<", code: 421)
        gView.gestures.addSymbol(symbol: ">", code: 12345)
        gView.gestures.addSymbol(symbol: ">", code: 145)

    }
    
    func gesturesResult(string result: String) {
        textLable.text = result
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

