//
//  EnterRepetitionViewController.swift
//  AmnesiacDeafAunty
//
//  Created by Seow Yung Hoe on 09/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class EnterRepetitionViewController: UIViewController {
    
    
  
    
    var speech = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SeeResultSegue" {
        
        
        if let thirdpage = segue.destination as?
            ResultViewController{
            thirdpage.numberOfResponse = Int(labels.text!)
            thirdpage.responds = textField.text
            }
        }
    }
    
    //Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labels: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if speech == speech.uppercased() {
            textField.text = "NO, WE CAN'T DO THAT"
        } else if speech == "I love ya,aunty"{
            textField.text = "GOODBYE DEAR!"
        } else {textField.text = "HUH?! SPEAK UP, SANDRA!"
        }
        
    }

}

