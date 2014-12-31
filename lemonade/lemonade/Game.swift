//
//  Game.swift
//  lemonade
//
//  Created by kostapappas lambros on 12/30/14.
//  Copyright (c) 2014 kostapappas lambros. All rights reserved.
//

import Foundation
import UIKit

class Game {
    
    let startMoney = 10
    let startIceCube = 1
    let startLemon = 1
    let lemonCost = 2
    let iceCost = 1
    
    var money = 0
    var lemons = 0
    var icecubes = 0
    
    var lemonsSupplies = 0
    var icecubeSupplies = 0
    var lemonsMix = 0
    var icecubeMix = 0
    
    var currentweather = 2 //by default warm 0 cold, 1, fair, 2, warm
    var weatherUIImage: UIImage!
    
    init(){
        startNewGame ()
    }
    
    func startNewGame () {
        money = startMoney
        lemons = startLemon
        icecubes = startIceCube
        createRandomWeather()
    }
    
    func createRandomWeather(){
        currentweather = Int(arc4random_uniform(UInt32(3)))
        switch currentweather {
            case 0: weatherUIImage = UIImage (named: "cold")
            case 1: weatherUIImage = UIImage (named: "mid")
            default: weatherUIImage = UIImage (named: "warm")
        }
    }
}