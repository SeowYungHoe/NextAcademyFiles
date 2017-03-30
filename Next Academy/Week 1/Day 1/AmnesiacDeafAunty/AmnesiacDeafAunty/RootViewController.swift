//
//  ViewController.swift
//  AmnesiacDeafAunty
//
//  Created by Seow Yung Hoe on 09/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("grandma")
    }
    

    
    //Outlets
    
    @IBOutlet weak var speechTextField: UITextField!


}

