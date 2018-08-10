//
//  ViewController.swift
//  DrawDemo
//
//  Created by Bogdan Ionescu on 09/08/2018.
//  Copyright © 2018 Bogdan Ionescu. All rights reserved.
//

import UIKit
@IBDesignable
class ViewController: UIViewController {
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        
    let demoView = DrawDemo(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
            y: self.view.frame.height/2 - height/2,
            width: width,
            height: height))
        self.view.addSubview(demoView)
    }
}

