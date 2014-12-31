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
    
    var weatherImageView: UIImageView!
    var backgroundImageView:UIImageView!
    var button: UIButton!
    var dollarLabel : UILabel!
    var lemonLabel : UILabel!
    var icecubeLabel : UILabel!
    var lemonSuppliesLabel : UILabel!
    var icecubeSuppliesLabel : UILabel!
    var lemonMixLabel : UILabel!
    var icecubeMixLabel : UILabel!
    var weatherLabel: UILabel!
    
    var currentGame: Game!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createInterface()
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //hide the statusbar fullscreen app
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func startNewGame(){
        
        currentGame = Game()
        weatherImageView.image = currentGame.weatherUIImage
        switch currentGame.currentweather {
            case 0: weatherLabel.text = "COLD"
            case 1: weatherLabel.text = "FAIR"
            default: weatherLabel.text = "WARM"
        }
        updateUI ()
    }
    
    func updateUI () {
        if currentGame != nil {
            dollarLabel.text = "\(currentGame.money)"
            lemonLabel.text = "\(currentGame.lemons)"
            icecubeLabel.text = "\(currentGame.icecubes)"
            lemonSuppliesLabel.text = "\(currentGame.lemonsSupplies)"
            icecubeSuppliesLabel.text = "\(currentGame.icecubeSupplies)"
            lemonMixLabel.text = "\(currentGame.lemonsMix)"
            icecubeMixLabel.text = "\(currentGame.icecubeMix)"
            
        }
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
        
        //creating weatherImageView
        weatherImageView = UIImageView(
            frame: CGRect (
                x:      self.view.bounds.origin.x + self.view.bounds.width *  (CGFloat)(2.2/kwdthPercent),
                y:      self.view.bounds.origin.y + self.view.bounds.height * (CGFloat)(8.2/kheigthPercent),
                width:  self.view.bounds.width *  (CGFloat)(3.2/kwdthPercent) ,
                height: self.view.bounds.height * (CGFloat)(2.6/kheigthPercent)
            )
        )
        weatherImageView.image = UIImage(named: "cold")
        self.view.addSubview(weatherImageView)
        
        //creating start button
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
        
        //creating minuslemon button
        createCustomButton( "minus_icon",
            actionName: "minusLemonPressed:",
            xPercent: (CGFloat)(10.5/kwdthPercent),
            yPercent: (CGFloat)(14.3/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //creating addlemon button
        createCustomButton( "plus_icon",
            actionName: "addLemonPressed:",
            xPercent: (CGFloat)(12.8/kwdthPercent),
            yPercent: (CGFloat)(14.3/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )

        //creating minusicecube button
        createCustomButton( "minus_icon",
            actionName: "minusIceCubePressed:",
            xPercent: (CGFloat)(10.5/kwdthPercent),
            yPercent: (CGFloat)(15.9/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //creating addicecube button
        createCustomButton( "plus_icon",
            actionName: "addIceCubePressed:",
            xPercent: (CGFloat)(12.8/kwdthPercent),
            yPercent: (CGFloat)(15.9/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //creating minusMixLemon button
        createCustomButton( "minus_icon",
            actionName: "minusMixLemonPressed:",
            xPercent: (CGFloat)(10.5/kwdthPercent),
            yPercent: (CGFloat)(17.8/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //creating addMixLemon button
        createCustomButton( "plus_icon",
            actionName: "addMixLemonPressed:",
            xPercent: (CGFloat)(12.8/kwdthPercent),
            yPercent: (CGFloat)(17.8/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //creating minusMixicecube button
        createCustomButton( "minus_icon",
            actionName: "minusMixIceCubePressed:",
            xPercent: (CGFloat)(10.5/kwdthPercent),
            yPercent: (CGFloat)(19.3/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //creating addMixicecube button
        createCustomButton( "plus_icon",
            actionName: "addMixIceCubePressed:",
            xPercent: (CGFloat)(12.8/kwdthPercent),
            yPercent: (CGFloat)(19.3/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent)
        )
        
        //create labels
        icecubeMixLabel =  createCustomLabel((CGFloat)(11.7/kwdthPercent),
            yPercent: (CGFloat)(19.3/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent),
            size: 21)
        lemonMixLabel =   createCustomLabel((CGFloat)(11.7/kwdthPercent),
            yPercent: (CGFloat)(17.8/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent),
            size: 21)
        icecubeSuppliesLabel =   createCustomLabel((CGFloat)(11.7/kwdthPercent),
            yPercent: (CGFloat)(15.9/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent),
            size: 21)
        
        lemonSuppliesLabel =   createCustomLabel((CGFloat)(11.7/kwdthPercent),
            yPercent: (CGFloat)(14.3/kheigthPercent),
            widthPercent: (CGFloat)(1/kwdthPercent),
            heigthPercent:(CGFloat)(1/kwdthPercent),
            size: 21)
        dollarLabel =   createCustomLabel((CGFloat)(7.7/kwdthPercent),
            yPercent: (CGFloat)(8.9/kheigthPercent),
            widthPercent: (CGFloat)(2/kwdthPercent),
            heigthPercent:(CGFloat)(1.5/kwdthPercent),
            size: 40)
        lemonLabel =   createCustomLabel((CGFloat)(10.6/kwdthPercent),
            yPercent: (CGFloat)(8.9/kheigthPercent),
            widthPercent: (CGFloat)(2/kwdthPercent),
            heigthPercent:(CGFloat)(1.5/kwdthPercent),
            size: 40)
        
        icecubeLabel =   createCustomLabel((CGFloat)(13.6/kwdthPercent),
            yPercent: (CGFloat)(8.9/kheigthPercent),
            widthPercent: (CGFloat)(2/kwdthPercent),
            heigthPercent:(CGFloat)(1.5/kwdthPercent),
            size: 40)
        
        weatherLabel =   createCustomLabel((CGFloat)(1.6/kwdthPercent),
            yPercent: (CGFloat)(10.4/kheigthPercent),
            widthPercent: (CGFloat)(4/kwdthPercent),
            heigthPercent:(CGFloat)(1.5/kwdthPercent),
            size: 23)
        

        
    }
    
    func startButtonPressed (sender:UIButton!) {
        println("button tapped")
    }
    
    func minusLemonPressed (sender:UIButton!) {
        println ("minus lemon tapped")
        if currentGame != nil {
            if currentGame.lemonsSupplies > 0 {
                currentGame.lemonsSupplies--
                updateUI()
            }
        }
    }
    
    func minusIceCubePressed (sender:UIButton!) {
        println ("minus icecube tapped")
        if currentGame != nil {
            if currentGame.icecubeSupplies > 0 {
                currentGame.icecubeSupplies--
                updateUI()
            }
        }
    }
    
    func minusMixLemonPressed (sender:UIButton!) {
        println ("minus Mixlemon tapped")
    }
    
    func minusMixIceCubePressed (sender:UIButton!) {
        println ("minus Mixicecube tapped")
    }
    
    func addLemonPressed (sender:UIButton!) {
        println ("add lemon tapped")
        if currentGame != nil {
                currentGame.lemonsSupplies++
                updateUI()
            
        }
    }
    
    func addIceCubePressed (sender:UIButton!) {
        println ("add icecube tapped")
        if currentGame != nil {
            currentGame.icecubeSupplies++
            updateUI()
            
        }
    }
    
    func addMixLemonPressed (sender:UIButton!) {
        println ("add Mixlemon tapped")
    }
    
    func addMixIceCubePressed (sender:UIButton!) {
        println ("add Mixicecube tapped")
    }
    
    func createCustomLabel (xPercent: CGFloat, yPercent: CGFloat, widthPercent: CGFloat, heigthPercent: CGFloat, size: CGFloat) -> UILabel {
        var label = UILabel(frame: CGRectMake(
                (self.view.bounds.origin.x + self.view.bounds.width *  xPercent),
                (self.view.bounds.origin.y + self.view.bounds.height * yPercent),
                self.view.bounds.width * widthPercent,
                self.view.bounds.height * heigthPercent)
                  )
        //label.center = CGPointMake(self.view.bounds.origin.x + self.view.bounds.width/2,
          //                         self.view.bounds.origin.y + self.view.bounds.height/2)
        label.textAlignment = NSTextAlignment.Center
        label.text = "00"
        label.font = UIFont(name: "trebuchetMS", size: size)
        self.view.addSubview(label)
        return label
    }
    
    
    func createCustomButton( imageName:String, actionName: Selector, xPercent: CGFloat, yPercent: CGFloat, widthPercent: CGFloat, heigthPercent: CGFloat ){
        button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(
            (self.view.bounds.origin.x + self.view.bounds.width *  xPercent),
            (self.view.bounds.origin.y + self.view.bounds.height * yPercent),
             self.view.bounds.width * widthPercent,
             self.view.bounds.height * heigthPercent)
        if let image  = UIImage(named: imageName) {
            button.setImage(image, forState: .Normal)
            //println("image not nil")
        }
        button.addTarget(self, action: actionName, forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }

}

