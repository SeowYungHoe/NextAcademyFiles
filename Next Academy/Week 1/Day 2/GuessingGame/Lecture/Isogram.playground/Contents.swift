//: Playground - noun: a place where people can play

import UIKit

var string = "isogram"
//Removed everything but alphabets
var removeSpacing = string.components(separatedBy: CharacterSet.letters.inverted).joined(separator: "")

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

}
