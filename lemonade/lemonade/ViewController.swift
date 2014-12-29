//
//  ViewController.swift
//  lemonade
//
//  Created by kostapappas lambros on 12/29/14.
//  Copyright (c) 2014 kostapappas lambros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kwdthPercent = 16.5
    let kheigthPercent = 29.5
    let kbuttonheightPercent = 26.0/29.5
    let kbuttonwidthPercent = 4.5/16.5
    
    
    var backgroundImageView:UIImageView!
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //hide the statusbar fullscreen app
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func createInterface () {
        
        //creating background
        backgroundImageView = UIImageView(
            frame: CGRect (
                x:      self.view.bounds.origin.x,
                y:      self.view.bounds.origin.y,
                width:  self.view.bounds.width,
                height: self.view.bounds.height
            )
        )
        backgroundImageView.image = UIImage(named: "background")
        self.view.addSubview(backgroundImageView)
        
        //creating button
        button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(
             (self.view.bounds.origin.x + self.view.bounds.width *  (CGFloat)(4.5/kwdthPercent)),
             (self.view.bounds.origin.y + self.view.bounds.height * (CGFloat)(23.5/kheigthPercent)),
              100,
              100)
        if let image  = UIImage(named: "startbutton.png") {
            button.setImage(image, forState: .Normal)
            println("image not nil")
        }
        button.addTarget(self, action: "startButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func startButtonPressed (sender:UIButton!) {
        println("button tapped")
    }

}

