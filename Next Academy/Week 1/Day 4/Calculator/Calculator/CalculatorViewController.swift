//
//  ViewController.swift
//  Calculator
//
//  Created by Seow Yung Hoe on 12/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    var userHasBegunTyping = false
    var savedOperator: String? = nil
    var accumulator = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttonCollection {
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.black.cgColor
        }
    }

    //OUTLETS
    @IBOutlet weak var displayLabel: UILabel!
    
    //ACTIONS
    @IBAction func onDigitButtonPressed(_ sender: UIButton) {
        
        guard let labelText = self.displayLabel.text else {return}
        
        if labelText.characters.count > 9{
            return
        }
        
        if userHasBegunTyping {
        self.displayLabel.text = labelText + sender.titleLabel!.text!
        }else{
            self.displayLabel.text = sender.titleLabel!.text!
            userHasBegunTyping = true
        }
    
    
        print(sender.titleLabel!.text)
        
        
    }
    
    @IBAction func onClearButtonPressed(_ sender: UIButton) {
        self.displayLabel.text = "0"
        userHasBegunTyping = false
        self.savedOperator = nil
    }
    
    @IBAction func onBinaryOperatorPressed(_ sender: UIButton) {
        guard let pressedOperator = sender.titleLabel?.text else {return}
        guard let labelText = self.displayLabel.text else {return}

        if savedOperator == nil{
            accumulator = Int(labelText)!
            self.savedOperator = pressedOperator
            userHasBegunTyping = false
            return
        }
        
        var result: Int = 0
        
        if savedOperator == "+"{
            result = accumulator + Int(labelText)!
        }else if savedOperator == "-"{
            result = accumulator - Int(labelText)!
        }else if savedOperator == "x"{
            result = accumulator * Int(labelText)!
        }else if savedOperator == "÷"{
            result = accumulator / Int(labelText)!
        }

        self.displayLabel.text = "\(result)"
        userHasBegunTyping = false
        accumulator = result
        savedOperator = pressedOperator
        
        //if pressedOperator == "+"{
            //firstNumber + labelText
    }
    
        //self.savedOperator = pressedOperator
        //userHasBegunTyping = false

    
    
    
    //OUTLETS CONNECTION
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    
    
}

