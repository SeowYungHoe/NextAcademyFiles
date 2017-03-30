//
//  ViewController.swift
//  MyBrowser
//
//  Created by Seow Yung Hoe on 11/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.urlTextField.delegate = self
       self.variableWebView.delegate = self
        
        
        let homepage = "https://nextacademy.com"
        if let url = URL(string: homepage){
            let request = URLRequest(url: url)
        variableWebView.loadRequest(request)
            
            
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    //Text Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let userInput = self.urlTextField.text{
            loadUrlString(string: "https://\(userInput)")
        }
        
        return true
    }
    
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        self.activityLoader.stopAnimating()
        
        showErrorAlert(errorMessage: "Failed to load given URL")
    }
    
    
    //Activity Loader
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.activityLoader.startAnimating()
        
        if variableWebView.canGoBack {
            backButton.isEnabled = true
        } else {
            backButton.isEnabled = false
        }
        
        if variableWebView.canGoForward {
            forwardButton.isEnabled = true
        } else {
            forwardButton.isEnabled = false
        }
    
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activityLoader.stopAnimating()
    }
 
    
    
    //Error Alert Function
    func showErrorAlert(errorMessage:String){
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        let homeAction = UIAlertAction(title: "HOME", style: .default, handler: {(action) in
            
            let homepage = "https://google.com"
            self.urlTextField.text = homepage
            
            self.loadUrlString(string: homepage)
    
        })
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(homeAction)
        alert.addAction(okAction)
        
        present(alert, animated:true, completion: nil)
    }
    
    //Load URL String
    func loadUrlString(string:String){
        if let url = URL(string: string){
            let request = URLRequest(url: url)
            self.variableWebView.loadRequest(request)
        }else{
            showErrorAlert(errorMessage: "URL format is invalid")
        }
    }
    
    
    func comingSoonAlert(message: String){
        
        let alert = UIAlertController(title: "Please be patient", message: message, preferredStyle: .alert)
        
        let thanks = UIAlertAction(title: "I CAN'T WAIT", style: .default, handler: nil)
        
        alert.addAction(thanks)
        present(alert, animated: true, completion: nil)
    }
    
    
//OUTLETS
    @IBOutlet weak var variableWebView: UIWebView!

    @IBOutlet weak var urlTextField: UITextField!
    
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!

 
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var forwardButton: UIButton!
    
//ACTIONS
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        variableWebView .goBack()
    }
    
    
    @IBAction func onForwardButtonPressed(_ sender: UIButton) {
        variableWebView.goForward()
    }
    
    @IBAction func onStopLoadingButtonPressed(_ sender: UIButton) {
        variableWebView.stopLoading()
    }
    
    @IBAction func onReloadButtonPressed(_ sender: UIButton) {
        variableWebView.reload()
    }
    
    @IBAction func comingSoonButton(_ sender: UIButton) {
        comingSoonAlert(message: "Coming Soon!")
    }
    
    
    }

