//
//  ViewController.swift
//  MiniBrowser
//
//  Created by Seow Yung Hoe on 11/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.textField.delegate = self
        self.webView.delegate = self
        
        
        let homepage = "https://nextacademy.com"
        if let url = URL(string: homepage){
            let request = URLRequest(url: url)
            
            
            webView.loadRequest(request)
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let userInput = self.textField.text{
            loadUrlString(string: userInput)
        }
        
        
        return true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        self.activityLoader.stopAnimating()
        
        showErrorAlert(errorMessage: "Failed to load given URL")
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.activityLoader.startAnimating()
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activityLoader.stopAnimating()
    }
    
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
    
    func loadUrlString(string: String){
        if let url = URL(string: string){
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        }else{
            showErrorAlert(errorMessage: "URL format is invalid")
        }

    }
    
    //outlets
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
}


