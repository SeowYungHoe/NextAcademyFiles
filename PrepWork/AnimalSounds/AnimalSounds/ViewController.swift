//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Seow Yung Hoe on 06/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


//Outlets
    
    @IBOutlet weak var animalSoundLabel: UILabel!
    
    
//Actions
    
    @IBAction func catButtonTapped(_ sender: AnyObject) {
        animalSoundLabel.text = "Meow!"
        meowSound.play()
    }
    
    @IBAction func dogButtonTapped(_ sender: AnyObject) {
        animalSoundLabel.text = "Woof!"
        woofSound.play()
    }
    
    @IBAction func cowButtonTapped(_ sender: AnyObject) {
        animalSoundLabel.text = "Moo!"
        mooSound.play()
    }
    
    let meowSound = SimpleSound(named: "meow")
    let woofSound = SimpleSound(named: "woof")
    let mooSound = SimpleSound(named: "moo")


    
}

