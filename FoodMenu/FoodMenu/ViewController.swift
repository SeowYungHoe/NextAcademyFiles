//
//  ViewController.swift
//  FoodMenu
//
//  Created by Seow Yung Hoe on 18/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, MenuCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var drinkImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.dataSource = self
        tableView.rowHeight = 200
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //food row
        if indexPath.row == 0 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! MenuCell
            
            cell.delegate = self
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! MenuCell
            
            cell.delegate = self
            return cell
        }
    }
    
    func didSelectFood(image: UIImage?) {
    foodImageView.image = image
    }
    
    func didSelectDrink(image: UIImage?) {
    drinkImageView.image = image
    }
    
}

