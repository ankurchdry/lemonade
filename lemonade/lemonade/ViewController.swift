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
        updateUI ()
    }
    
    func updateUI () {
        if currentGame != nil {
            //update the weather
            switch currentGame.currentweather {
            case 0:
                weatherLabel.text = "COLD"
                weatherImageView.image = UIImage(named: "cold")
            case 1:
                weatherLabel.text = "FAIR"
                weatherImageView.image = UIImage(named: "mid")
            default:
                weatherLabel.text = "WARM"
                weatherImageView.image = UIImage(named: "warm")
            }
            
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
        

        updateUI()
        
    }
    
    func startButtonPressed (sender:UIButton!) {
        println("button tapped")
        
        //create lemonadeRation
        var lemonadeRatio = 0.0
        if currentGame.icecubeMix > 0{
            lemonadeRatio = Double(currentGame.lemonsMix)/Double(currentGame.icecubeMix)
        }
        else{
            lemonadeRatio = Double(currentGame.lemonsMix)  + 1 //acidic lemonade otherwise would be 1 if only one lemon exist!
        }
        
        if (currentGame.lemonsMix > 0 ) || (currentGame.icecubeMix > 0 ) {
            println ("Lemonade ration = \(lemonadeRatio)")
        
            //create random customers
            var customers = Int(arc4random_uniform(UInt32(10)))
            
            //bonus affect them by the weather
            if (currentGame.currentweather==0){
                customers -= 3
                if (customers < 0){
                    customers = 0
                }
            }
            
            if (currentGame.currentweather==2){
                customers += 5
                
            }
            
            println("TotalCustomers = \(customers+1)")
        
            var totalpaid = 0
            for  index in 0...customers{
                //for each customer create a random taste
                var customertaste = Double(Int(arc4random_uniform(UInt32(9)) + 1))/10.0
                var paid = false
                
                switch customertaste {
                    case 0.0...0.399:
                        if (lemonadeRatio>1) {
                            println("customer \(index) has taste \(customertaste) for acidic lemonade and PAID!")
                            paid = true
                            totalpaid++
                        }
                    case 0.4...0.599:
                        if (lemonadeRatio==1) {
                            println("customer \(index) has taste \(customertaste) for Equal lemonade and PAID!")
                            paid = true
                            totalpaid++

                        }
                    case 0.6...1.0:
                        if (lemonadeRatio<1) {
                        println("customer \(index) has taste \(customertaste) for acidic lemonade and PAID!")
                            paid = true
                            totalpaid++
                        }
                    default: println("customer \(index) has taste \(customertaste) and No match, No Revenue")
                }
                if !paid{
                    println("customer \(index) has taste \(customertaste) and No match, No Revenue")
                }
                else
                {
                    currentGame.money++
                    updateUI()
                }
                //println("customer \(index) has taste \(customertaste)")
            } //end check the customers
            
           
            
            //clear the states for next game
            currentGame.lemonsMix = 0
            currentGame.icecubeMix = 0
            currentGame.lemonsSupplies = 0
            currentGame.icecubeSupplies = 0
            currentGame.currentweather =  Int(arc4random_uniform(UInt32(3)))
            
            if currentGame.money == 0 && currentGame.lemons==0 && currentGame.icecubes==0 {
                
                var refreshAlert = UIAlertController(
                    title: "End of Game",
                    message: "No money no funny! the game will restart automatically",
                    preferredStyle: UIAlertControllerStyle.Alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                    //println("Handle Ok logic here")
                }))
                presentViewController(refreshAlert, animated: true, completion: nil)
                startNewGame()

            }
            else{
                var refreshAlert = UIAlertController(
                    title: "End of day results",
                    message: "Total Customers paid = \(totalpaid) \n Total customers =\(customers)",
                    preferredStyle: UIAlertControllerStyle.Alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                    //println("Handle Ok logic here")
                }))
                presentViewController(refreshAlert, animated: true, completion: nil)
            }
            
            updateUI()
        }
    }
    
    func minusLemonPressed (sender:UIButton!) {
        println ("minus lemon tapped")
        if currentGame != nil {
            if currentGame.lemonsSupplies > 0 {
                currentGame.lemonsSupplies--
                currentGame.money += currentGame.lemonCost
                
                
                if (currentGame.lemons == 0){
                    currentGame.lemonsMix--
                }
                else
                {
                    currentGame.lemons--
                }
                
                updateUI()
            }
        }
    }
    
    func minusIceCubePressed (sender:UIButton!) {
        println ("minus icecube tapped")
        if currentGame != nil {
            if currentGame.icecubeSupplies > 0 {
                currentGame.icecubeSupplies--
                currentGame.money += currentGame.iceCost
                
                
                
                if (currentGame.icecubes == 0 ){
                    currentGame.icecubeMix--
                }
                else {
                    currentGame.icecubes--
                }
                
                updateUI()
            }
        }
    }
    
    func minusMixLemonPressed (sender:UIButton!) {
        println ("minus Mixlemon tapped")
        if currentGame != nil {
            if currentGame.lemonsMix > 0 {
                currentGame.lemonsMix--
                currentGame.lemons++
                updateUI()
            }
        }
    }
    
    func minusMixIceCubePressed (sender:UIButton!) {
        println ("minus Mixicecube tapped")
        if currentGame != nil {
            if currentGame.icecubeMix > 0 {
                currentGame.icecubeMix--
                currentGame.icecubes++
                updateUI()
            }
        }
    }
    
    func addLemonPressed (sender:UIButton!) {
        println ("add lemon tapped")
        if (currentGame != nil) && ((currentGame.money - currentGame.lemonCost)>=0) {
                currentGame.lemonsSupplies++
                currentGame.money -= currentGame.lemonCost
                currentGame.lemons++
                updateUI()
            
        }
    }
    
    func addIceCubePressed (sender:UIButton!) {
        println ("add icecube tapped")
        if (currentGame != nil) && ((currentGame.money - currentGame.iceCost)>=0) {
            currentGame.icecubeSupplies++
            currentGame.money -= currentGame.iceCost
            currentGame.icecubes++
            updateUI()
            
        }
    }
    
    func addMixLemonPressed (sender:UIButton!) {
        println ("add Mixlemon tapped")
        if (currentGame != nil) && ((currentGame.lemons - 1)>=0) {
            currentGame.lemonsMix++
            currentGame.lemons--
            updateUI()
            
        }
    }
    
    func addMixIceCubePressed (sender:UIButton!) {
        println ("add Mixicecube tapped")
        if (currentGame != nil) && ((currentGame.icecubes - 1)>=0) {
            currentGame.icecubeMix++
            currentGame.icecubes--
            updateUI()
            
        }
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

