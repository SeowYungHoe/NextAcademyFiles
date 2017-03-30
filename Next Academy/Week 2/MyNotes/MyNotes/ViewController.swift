//
//  ViewController.swift
//  MyNotes
//
//  Created by Seow Yung Hoe on 17/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

 var notes : [Note] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Outlets

    @IBOutlet weak var notesTableView: UITableView!
    
    //Actions
    
    
    
    //ETC

    
    //ViewDiDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        
        createNotes()
        notesTableView.reloadData()
        
        
    } 
    
    
    //TableView Function (Datasource)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
      
        let noteNumber = notes[indexPath.row]
        
        
        
        cell.textLabel?.text = noteNumber.title
        //cell.detailTextLabel?.text = noteNumber.
        

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //get storyboard where the ViewController belong
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //instantiate the controller
        guard let controller = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {return}
        
        let selectedNotes = notes[indexPath.row]
        
        //
        controller.note = selectedNotes
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }


    
    //Function
    func createNotes(){
        
        let cook = Note()
        cook.title = "What to cook?"
        notes.append(cook)
        
        let cardioWorkout = Note()
        cardioWorkout.title = "Burpees"
        notes.append(cardioWorkout)
        
        let chestDay = Note()
        chestDay.title = "Chest Press"
        notes.append(chestDay)
        
        
    }
    
    
    
    
    
    

}

