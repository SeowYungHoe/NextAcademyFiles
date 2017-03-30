//
//  ListViewController.swift
//  Week2Assessment (SeowYungHoe)
//
//  Created by Seow Yung Hoe on 20/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var playstationTitleNavigation: UINavigationItem!
    
    @IBOutlet weak var playstationImageView: UIImageView!
    
    @IBOutlet weak var playstationDateLabel: UILabel!
    
    
    @IBOutlet weak var wikiButtonOutlet: UIButton!
    
    
    
    var pstation: PlayStation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playstationImageView.image = pstation?.image
        playstationDateLabel.text = pstation?.date
        playstationTitleNavigation.title = pstation?.name

    }


    @IBAction func wikiButtonPressed(_ sender: UIButton) {
    
    
    guard let controller = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {return}

        
    navigationController?.pushViewController(controller, animated: true)
        
        
        
    }


}
