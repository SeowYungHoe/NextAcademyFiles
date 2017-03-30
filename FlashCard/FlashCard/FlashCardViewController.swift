//
//  FlashCardViewController.swift
//  FlashCard
//
//  Created by Seow Yung Hoe on 13/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class FlashCardViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var textView: UITextView!
    
    
    //Actions
    
    
    var numberOfGuess = 0

    override func viewDidLoad() {
        super.viewDidLoad()
textView.isEditable = false
        textView.isSelectable = false
        
        var currentIndex
    }






let questionList = ["Who is the smartest man alive?", "How do you kill a fire?", "Are you stupid?"]
    
    let answerList = ["Me", "with fire", "Yes"]


}
