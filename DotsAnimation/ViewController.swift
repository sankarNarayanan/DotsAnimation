//
//  ViewController.swift
//  DotsAnimation
//
//  Created by Sankar Narayanan on 4/1/15.
//  Copyright (c) 2015 Sankar Narayanan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewComponent: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var dots = self.startLoadingAnimation(CGRectMake(-90, -90, 180, 180), dotsColor: UIColor(red: 0, green: 188, blue: 244, alpha: 1),cornerRadius: 5.0, animationColor: UIColor.grayColor())
        viewComponent.addSubview(dots)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

