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
    
    // property, allows us to access Tigers in various functions
    var myTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // myTiger
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTigers.append(myTiger)
        
        // println("My tigers name is \(myTiger.name). It's breed is \(myTiger.breed), and it's age is \(myTiger.age).")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
        // secondTiger
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indo-Chinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        // thirdTiger
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        // fourthTiger
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        // set up an array of Tigers
        // var tigerNames:Array<String>     // alternate method
        // var tigerNames:[String]          // alternate method
        // var tigerNames = ["Tigger", "Tigress", "Jacob", "Spar"]
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        // generate a random number
        // UInt32 = unsigned integer, 32 bit
        // 5 - generates a random number 0 through 4
        let randomNumber = Int(arc4random_uniform(UInt32(5)))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: AnyObject) {
        // generate a random number
        // UInt32 = unsigned integer, 32 bit
        // 5 - generates a random number 0 through 4
        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        
        let tiger = myTigers[randomIndex]
        
        // update UI
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: {
            // must access these with self. syntax
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}

