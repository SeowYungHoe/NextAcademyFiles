//
//  WebViewController.swift
//  Week1Assessment
//
//  Created by Seow Yung Hoe on 13/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    
    
    //var passedWeb: UIWebView!
    

    //Outlets
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var webView: UIWebView!
    
    
    //Actions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.webView = self.passedWeb
        self.webView.delegate = self
        //self.textField.delegate = self

        let homepage = "https://www.google.com"
        if let url = URL(string: homepage){
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        
    }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let userInput = self.textField.text{
            loadUrlString(string: userInput)
        }
        
        
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    //ETC Func
    func afterRightAnswerAlert(message: String){
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let thanks = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        
        alert.addAction(thanks)
    }
    
    
    //Show Error Func
    
    func showErrorAlert(errorMessage: String){
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        let homeAction = UIAlertAction(title: "HOME", style: .default, handler: { (action) in
            
            let homepage = "https://nextacademy.com"
            self.textField.text = homepage
            
            self.loadUrlString(string: homepage)
            
            
        })
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(homeAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //Load URL Func
    func loadUrlString(string: String){
        if let url = URL(string: string){
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        }else{
            showErrorAlert(errorMessage: "URL Format is invalid")
        }

    

}
}

