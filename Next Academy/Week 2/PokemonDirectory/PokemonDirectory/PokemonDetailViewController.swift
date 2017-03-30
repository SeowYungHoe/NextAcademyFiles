//
//  PokemonDetailViewController.swift
//  PokemonDirectory
//
//  Created by Seow Yung Hoe on 17/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
     var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonImageView.image = pokemon?.image
        descriptionLabel.text = pokemon?.element
        navigationItem.title = pokemon?.name
    
    }




}
