//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Eric Liu on 6/11/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstFrame = CGRect(x: 100, y: 100, width: 200, height: 200)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 0, y: 0, width: 100, height: 150)
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.yellow
        firstView.addSubview(secondView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

