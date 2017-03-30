//
//  ViewController.swift
//  SpecialContacts
//
//  Created by Seow Yung Hoe on 16/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var nameToAdd : [String] = ["Bro", "dude"]
    var numberToAdd : [String] = ["999", "911"]

    
    //Outlets
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!

    

    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameToAdd.count
        return numberToAdd.count
    }
    
    
    
    
    // tell tableView the corresponding cell to use at particular row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //deque the cell from the one prepared earlier in storyboard using identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //get the item from your array
        let row = indexPath.row
        let todo = nameToAdd[indexPath.row]
        let todoNumber = numberToAdd[indexPath.row]
        
        //assign the value of item to cell .textLabel to display
        cell.textLabel?.text = todo
        

        
        
        return cell
    }

    
    
    
    //Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        
        
        
        let alert = UIAlertController(title: "Hello!", message: "Please enter name and number", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "Okay!", style: .default, handler: nil)
        
        alert.addAction(okay)
        alert.addTextField {(textField) in
            textField.placeholder = "Enter name"
            textField.tag = 0
            
            alert.addTextField {(textField) in
                textField.placeholder = "Enter number"
                textField.tag = 1
            
            
            self.view.endEditing(true)
            
            self.present(alert, animated: true, completion: nil)
        }
    
        }
        
        
        guard let name = alert.textFields![0].text ,
            let numberStr = alert.textFields![1].text ,
            let number = String(numberStr) else {return}
        
        self.nameToAdd.append(name)
        self.numberToAdd.append(number)
        tableView.reloadData()
        
    }
    
        






}
