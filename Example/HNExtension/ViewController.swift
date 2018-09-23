//
//  ViewController.swift
//  HNExtension
//
//  Created by guoweikun621@gmail.com on 09/21/2018.
//  Copyright (c) 2018 guoweikun621@gmail.com. All rights reserved.
//

import UIKit
import HNExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let arr = ["Sam", "Hello", "Susan"]
        let other = ["Sam", "Daxiong", "Susan", "DX"]
        
        arr.hn_merge(other) { (current, new) -> String in
            return new
            }.hn_filterRepeat { (e) -> String in
                return e
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

