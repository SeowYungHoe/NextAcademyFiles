//
//  ViewController.swift
//  TODOList
//
//  Created by Seow Yung Hoe on 16/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var todoTableView: UITableView!
    
    var todoItems : [String] = ["Go home","Buy Groceries","Sleep"]
    
    
    //ViewDiDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       todoTableView.dataSource = self
        todoTableView.delegate = self
        
        //Link button tap with a function programmatically
        addButton.addTarget(self, action: #selector(addToDoItem), for: .touchUpInside)
        
    }
    
    //MARK: TableView DataSource
    
    //Tell tableView how many row / item it should display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    
    
    
    // tell tableView the corresponding cell to use at particular row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //deque the cell from the one prepared earlier in storyboard using identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //get the item from your array
        let row = indexPath.row
        let todo = todoItems[indexPath.row]
        
        //assign the value of item to cell .textLabel to display
        cell.textLabel?.text = todo
        
    return cell
    }
    
    //Mark: TableView Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = UIColor.red
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        
        cell.contentView.backgroundColor = color
    }
    


    // MARKL Functions
    func addToDoItem() {
        
        //check if textfield has text
        guard let newItem = textField.text else {
            return
        }
        
        //add item to the array
        todoItems.append(newItem)
        
        //reload tableView
        todoTableView.reloadData()
        
        //remote text from TextField
        textField.text = ""
    }
    

}

