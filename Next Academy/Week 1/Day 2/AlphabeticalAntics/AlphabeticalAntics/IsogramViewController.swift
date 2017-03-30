//
//  IsogramViewController.swift
//  AlphabeticalAntics
//
//  Created by Seow Yung Hoe on 10/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class IsogramViewController: UIViewController {

    
    
    //Outlets
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    //Actions
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        
        let userInput = self.inputTextField.text!
        //Removed everything but alphabets
        let removeSpacing = userInput.components(separatedBy: CharacterSet.letters.inverted).joined(separator: "")
        
        //Lowercased String
        var lowercasedString = removeSpacing.lowercased()
        
        
        
        
        var isIsogram = true
        
        for index in 0..<lowercasedString.characters.count{
            //get the current string
            let charIndex = lowercasedString.index(lowercasedString.startIndex,offsetBy: index)
            //get current character
            let currentCharacter = lowercasedString[charIndex]
            
            for comparedIndex in (index + 1)..<lowercasedString.characters.count{
                let comparedStringIndex = lowercasedString.index(lowercasedString.startIndex, offsetBy: comparedIndex)
                let comparedCharacter = lowercasedString[comparedStringIndex]
                
                if currentCharacter == comparedCharacter{
                    isIsogram = false
                }
                
                
            }
            
            if(isIsogram){
                self.displayLabel.text = "It is an isogram"
            }else {self.displayLabel.text = "Not a isogram"}
        }

    }
    
    
    
    
    
    
}
