//
//  ViewController.swift
//  Week1Assessment
//
//  Created by Seow Yung Hoe on 13/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "magic22")
        backgroundImage.contentMode =  UIViewContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
        
//        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "danka"))
        
        
        
        button.isEnabled = false
        
    
    }
    
    
    
    
    //Outlets
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    
    
    
    //Actions
    
    @IBAction func pressedButton(_ sender: UIButton) {
        
        
//        guard let text1 = textField1.text ,
//            let text2 = textField2.text else { return }
//        
//        
//        let userInput = Int(text1) ?? 0
//        let userInput2 = Int(text2) ?? 0

        guard let labelText = Int(self.resultsLabel.text!) else {return}

        
        let rightAnswer = 999
        
        if labelText == rightAnswer {
        
        
//        if userInput + userInput2 == rightAnswer{
        
            
            performSegue(withIdentifier: "nextSegue", sender: nil)
            afterRightAnswerAlert(message: "What you looking at?")

        }
        
        
    }
   
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        
        guard let text1 = textField1.text ,
            let text2 = textField2.text else { return }
        
        
        let userInput = Int(text1) ?? 0
        let userInput2 = Int(text2) ?? 0
        
        var result = userInput + userInput2
        
        let rightAnswer = 999
        
        
        self.resultsLabel.text = "\(result)"
        
        if (result % 9 == 0) {
        dividedByNineAlert(message: "You're a GENIUS!")
        }
        
        if result == rightAnswer {
            button.isEnabled = true
        }
    }
    


    
    
    
    //ETC FUNC
    func afterRightAnswerAlert(message: String){
        
        let alert = UIAlertController(title: "You there!", message: message, preferredStyle: .alert)
        
        let thanks = UIAlertAction(title: "Nothing Sir!", style: .default, handler: nil)
        
        alert.addAction(thanks)
        present(alert, animated: true, completion: nil)
    }
    
    func dividedByNineAlert(message: String){
        let alert = UIAlertController(title: "Are you a math prodigy?", message: message, preferredStyle: .alert)
        
        let thanks = UIAlertAction(title: "I know", style: .default, handler: nil)
        
        alert.addAction(thanks)
        present(alert, animated: true, completion: nil)
    }

}

