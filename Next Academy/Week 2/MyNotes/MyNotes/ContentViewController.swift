//
//  ContentViewController.swift
//  MyNotes
//
//  Created by Seow Yung Hoe on 17/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit


class ContentViewController: UIViewController, UITextFieldDelegate{

    

    
    
    //Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    //Actions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        guard let text1 = textField.text else { return }
        
       
        
        let newNote = Note()
        newNote.title = text1
        notes.append(newNote)

    
        self.dismiss(animated: true, completion: nil)
        
        

    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //---
    var note: Note?
    
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationItem.title = note?.title
        
        
        //Save Button Enable/Disable
        saveButton.isEnabled = false

        textField.delegate = self
        
        textField.addTarget(self, action: #selector(ContentViewController.textFieldDidBeginEditing(_:)), for: UIControlEvents.editingChanged)

        
    }
    
    
    
//textbeginediting
    

    func  textFieldDidBeginEditing(_ textField: UITextField) {

    guard let text1 = textField.text else { return }
 
        if text1.isEmpty {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
        

}

}
