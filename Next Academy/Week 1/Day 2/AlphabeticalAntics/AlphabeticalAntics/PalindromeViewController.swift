//
//  ViewController.swift
//  AlphabeticalAntics
//
//  Created by Seow Yung Hoe on 10/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class PalindromeViewController: UIViewController {




//Outlets
    @IBOutlet weak var inputTextField: UITextField!

    @IBOutlet weak var displayLabel: UILabel!
    
//Actions
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        let userInput = self.inputTextField.text!
        
        //Removed everything but alphabets
        let removeSpacing = userInput.components(separatedBy: CharacterSet.letters.inverted).joined(separator: "")
        
        //Lowercased String
        var lowercasedString = removeSpacing.lowercased()
        
        var isPalindrome = true
        
        for index in 0...(lowercasedString.characters.count / 2){
            
            let frontIndex = lowercasedString.index(lowercasedString.startIndex, offsetBy: index)
            let backIndex = lowercasedString.index(lowercasedString.endIndex, offsetBy: -1 - index)
            
            let front = lowercasedString[frontIndex]
            let back = lowercasedString[backIndex]
            
            if front != back {
                isPalindrome = false
            }
        }
        
        if(isPalindrome){
            self.displayLabel.text = "It is a palindrome"
        }else {self.displayLabel.text = "Not a palindrome"
    }
}

}
