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
        let other = ["Sam", "Hello", "Daxiong", "Susan", "DX"]
        
        let res = arr.hn.isSubset(of: other)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

