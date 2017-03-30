//
//  ViewController.swift
//  Week2Assessment (SeowYungHoe)
//
//  Created by Seow Yung Hoe on 20/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var playStation : [PlayStation] = []


    
    //Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //Actions
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    playstationModels()
        
    }


    //TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playStation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let ps = playStation[indexPath.row]
        cell.textLabel?.text = ps.name
        cell.detailTextLabel?.text = ps.date
        cell.imageView?.image = ps.image
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        
        let selectedPlayStation = playStation[indexPath.row]
        controller.pstation = selectedPlayStation
        navigationController?.pushViewController(controller, animated: true)
    }
    

    
    
    
    
    //Functions

    func playstationModels() {
        
        let playstationOne = PlayStation()
        playstationOne.name = "PlayStationOne"
        playstationOne.date = "December 1994"
        playstationOne.image = UIImage(named: "PS1")
        playStation.append(playstationOne)
        
        let playstationTwo = PlayStation()
        playstationTwo.name = "PlayStationTwo"
        playstationTwo.date = "March 2000"
        playstationTwo.image = UIImage(named: "PS2")
        playStation.append(playstationTwo)
        
        let playstationPortable = PlayStation()
        playstationPortable.name = "PlayStationPortable"
        playstationPortable.date = "December 2004"
        playstationPortable.image = UIImage(named: "PSP")
        playStation.append(playstationPortable)
        
        let playstationThree = PlayStation()
        playstationThree.name = "PlayStationThree"
        playstationThree.date = "November 2006"
        playstationThree.image = UIImage(named: "PS3")
        playStation.append(playstationThree)
        
        let playstationFour = PlayStation()
        playstationFour.name = "PlayStationFour"
        playstationFour.date = "November 2013"
        playstationFour.image = UIImage(named: "PS4")
        playStation.append(playstationFour)
        
        
    }

    
    
}

