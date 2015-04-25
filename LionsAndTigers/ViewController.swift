//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Matthew Wood on 2015-04-22.
//  Copyright (c) 2015 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    // property, allows us to access Tigers in various functions
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)    // a tuple
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // myTiger
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        self.myTigers.append(myTiger)
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        myTiger.chuff()
        
        // println("My tigers name is \(myTiger.name). It's breed is \(myTiger.breed), and it's age is \(myTiger.age).")
        
        // self can be used for properties of ViewController class
        // cannot be used for structs
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        // secondTiger
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indo-Chinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        // thirdTiger
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = secondTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        // fourthTiger
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        // set up an array of Tigers
        // var tigerNames:Array<String>     // alternate method
        // var tigerNames:[String]          // alternate method
        // var tigerNames = ["Tigger", "Tigress", "Jacob", "Spar"]
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        // generate a random number
        // UInt32 = unsigned integer, 32 bit
        // 5 - generates a random number 0 through 4
        let randomNumber = Int(arc4random_uniform(UInt32(5)))
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lion.changeToAlphaMale()    // can change properties within functions in classes, not structs
        println(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: AnyObject) {
//        // sender is a parameter, can be altered
//        // ex. sender.setAngle(1.0, magnitude: 1.0)
//        
//        var randomIndex:Int
//        // generate a random number
//        // UInt32 = unsigned integer, 32 bit
//        // 5 - generates a random number 0 through 4
//        //let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
//        
//        do {
//            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
//        } while randomIndex == self.currentIndex
//        
//        self.currentIndex = randomIndex
//        
//        let tiger = self.myTigers[randomIndex]
//        
//        // update UI
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
//        
//        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: {
//            // must access these with self. syntax
//            self.myImageView.image = tiger.image
//            self.nameLabel.text = tiger.name
//            self.ageLabel.text = "\(tiger.age)"
//            self.breedLabel.text = tiger.breed
//            }, completion: {
//                (finished: Bool) -> () in
//        })
//            self.randomFactLabel.text = tiger.randomFact()
        
        updateAnimal()
        updateView()
    }
    
    func updateAnimal () {
        switch currentAnimal {
        
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(self.lions.count)))
            currentAnimal = ("Lion", randomIndex)
            
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(self.myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: {
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
                
            } else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
            }
            }, completion: {
                (finished: Bool) -> () in
        })
        self.randomFactLabel.hidden = false
    }

}

