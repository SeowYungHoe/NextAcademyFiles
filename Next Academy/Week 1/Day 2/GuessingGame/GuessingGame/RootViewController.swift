//
//  ViewController.swift
//  GuessingGame
//
//  Created by Seow Yung Hoe on 10/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       secretNumberLabel.isHidden = true
    }

    let secretNumbers = 50
    
    var response = 0
    
    
    
    //outlets
    
    @IBOutlet weak var numberOfResponse: UILabel!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var secretNumberLabel: UILabel!
    
    //actions
    

    @IBAction func revealNumberPressed(_ sender: UIButton) {
        self.secretNumberLabel.isHidden = false
        secretNumberLabel.text = String(secretNumbers)
        
    }
    
    
    
    var savedAns = -1
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        var userInput = Int(inputTextField.text!)!
        
        
        if savedAns == userInput {
            return
        }else{
            savedAns = userInput
        
        
        if (userInput < secretNumbers) {
            displayLabel.text = "A little too low"
        }
        else if (userInput == secretNumbers) {
            displayLabel.text = "Amazing"
        }
        else {
            displayLabel.text = "A little too high"
        }
        
        
        response += 1
        //response = response + 1
        self.numberOfResponse.text = "Number of response: \(response)"
        }

    
    
        
}
}

    


