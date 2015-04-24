//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Matthew Wood on 2015-04-22.
//  Copyright (c) 2015 Matthew. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    
    var age = 0             // default value of 0
    // var age:Int!         // alternate way
    
    var name = ""           // default to empty string
    var breed = ""          // default to empty string
    
    var image = UIImage(named:"")   // "" will cause issues, could put a default picture
    
    // function within struct
    func chuff () {
        println("Tiger: Chuff Chuff")
    }
    
    func chuffANumberOfTimes (numberOfTimes:Int) {
        for var chuff = 0; chuff < numberOfTimes; chuff++ {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes (numberOfTimes:Int, isLoud:Bool) {
        // okay that function name is the same because number of parameters is different
        
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            } else {
                println("Tiger: purr purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
        
        // return (regularAge * 3) <-- alternate condensed form
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The tiger is the largest species in the cat family."
        } else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters."
        } else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'."
        }
        return randomFact
    }
}