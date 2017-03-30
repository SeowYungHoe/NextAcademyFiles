//
//  ResultViewController.swift
//  AmnesiacDeafAunty
//
//  Created by Seow Yung Hoe on 09/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var numberOfResponse: Int!
    var responds: String!


    //Outlets
    @IBOutlet weak var textView: UITextView!
    
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var grandmaAnswer = "aa"
        var userTypedIn = "10"
        
        var userInputConvertedToInt = Int(userTypedIn)!
        
        var textToAddToTextView = ""
        for _ in 1..userInputConvertedToInt {
            textToAddToTextView == grandmaAnswer + "\n"
        }

        // Do any additional setup after loading the view.
    }

    //ETC
    
    
    

    }


