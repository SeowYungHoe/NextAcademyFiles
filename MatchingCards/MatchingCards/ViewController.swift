//
//  ViewController.swift
//  MatchingCards
//
//  Created by Seow Yung Hoe on 23/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class Picture {
    
    var image: UIImage?
    var frameColor: UIColor = UIColor.black
    
}

class ViewController: UIViewController {

    
    //Outlets
    
    @IBOutlet weak var shuffleButtonPressed: UIBarButtonItem! {
        
        
        didSet {
            shuffleButtonPressed.target = self
            shuffleButtonPressed.action = #selector(shuffleMonster)
            
            
            
        }
    }
    
    @IBOutlet var imageCollection: [UIImageView]!

    
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    assignIntoEmptyArray()
        
        
        
        let firstLaunch = !UserDefaults.standard.bool(forKey: "launched")
        if firstLaunch {
            //create frame for textfield
            let frame = CGRect(x: 130 , y: 319, width: 500 , height: 500)
            
            let textView = UITextView(frame: frame)
        
            view.addSubview(textView) // add view programatically
            textView.text = "Step 1: Click on a card to reveal it \n" + "Step 2: Match the cards to win"
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textViewTapped(_:)))
            textView.addGestureRecognizer(tapGesture)
            textView.isUserInteractionEnabled = true
            
         

            
        }
    }
    

    //Array
    var summonersWarArray = [
    
        UIImage(named: "Homu")!,
        UIImage(named: "Undine")!,
        UIImage(named: "megan")!,
        UIImage(named: "hwahee")!,
        UIImage(named: "chowvsraki")!,
        UIImage(named: "Veromos")!,
        UIImage(named: "Neostone")!,
        UIImage(named: "Artamiel")!

    
    ]
    
    var summonersWarEmptyArray: [UIImage] = []

    
    
    
    func assignIntoEmptyArray() {
        summonersWarArray.forEach { (image) in
            for i in 0 ..< summonersWarArray.count {
                summonersWarEmptyArray.append(image)
            }
            print(summonersWarEmptyArray)
            
            
        }
    }


        
    func textViewTapped(_ sender: UITapGestureRecognizer) {
        
        //to set data to UserDefault
        UserDefaults.standard.set(true, forKey: "launched")
        //to save data which was set earlier to UserDefault
        UserDefaults.standard.synchronize()
        
        
        //remove view programatically
        sender.view?.removeFromSuperview()
    }
    

    
    func shuffleMonster() {
        
        shuffle(monster: summonersWarEmptyArray) {
        (shuffledMonster) in summonersWarEmptyArray = shuffledMonster
            
            
            
            
        }
        
        

        
    }
    
    
    func shuffle(monster:[UIImage], completion: (_ shuffledMonster:[UIImage]) -> Void){
        
        var shuffledMonster = monster
        
        
        let totalmonster = monster.count-1
        for i in 0 ... totalmonster {
            
            let randomInteger = Int(arc4random())
            
            let randomIndex = i + randomInteger % (totalmonster+1 - i)
            
            shuffledMonster[i] = monster[randomIndex]
            
        }
        
        completion(shuffledMonster)
        
        
    }

    

}
    
    


