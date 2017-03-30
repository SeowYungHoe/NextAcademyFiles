//: Playground - noun: a place where people can play

import UIKit


var string = "Was it a car or a cat i saw"


//Removed everything but alphabets
var removeSpacing = string.components(separatedBy: CharacterSet.letters.inverted).joined(separator: "")

//Lowercased String
var lowercasedString = removeSpacing.lowercased()

print(lowercasedString)


var isPalindrome = true

for index in 0...(lowercasedString.characters.count / 2){

    let frontIndex = lowercasedString.index(lowercasedString.startIndex, offsetBy: 0)
    let backIndex = lowercasedString.index(lowercasedString.endIndex, offsetBy: -1)
    
    let front = lowercasedString[frontIndex]
    let back = lowercasedString[backIndex]
    
    if front != back {
        isPalindrome = false
    }
}

print(isPalindrome)




//characters.count % 2
//let frontIndex = lowercasedString.index(lowercasedString.startIndex, offsetBy: 0)
//let backIndex = lowercasedString.index(lowercasedString.endIndex, offsetBy: -1)

//let front = lowercasedString[frontIndex]
//let back = lowercasedString[backIndex]

//print(front == back)


var initialString = "madam"
var reversedString = String(initialString.characters.reversed())
initialString == reversedString






