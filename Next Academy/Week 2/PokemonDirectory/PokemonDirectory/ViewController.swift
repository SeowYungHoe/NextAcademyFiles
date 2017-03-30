//
//  ViewController.swift
//  PokemonDirectory
//
//  Created by Seow Yung Hoe on 17/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//    var dictionary : [String:Any] = [:]
    var pokedex : [Pokemon] = []

    @IBOutlet weak var pokemonTableView: UITableView!
    
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        
//        //set the key and value
//        dictionary = ["pokemonName" : "Pikachu"]
//        
//        //retrieve the value based on key
//        let _ = dictionary["pokemonName"]
        
        
        
        createPokemons()
        
    }


    func createPokemons(){
        
        let pikachu = Pokemon()
        pikachu.name = "Pikachu"
        pikachu.element = "Electric"
        pikachu.image = UIImage(named: "pikachu" )
        
        pokedex.append(pikachu)
        
        let onyx = Pokemon()
        onyx.name = "Onyx"
        onyx.element = "Rock"
        onyx.image = UIImage(named: "onyx")
        
        pokedex.append(onyx)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //get the pokemon from pokedex
        let pokemon = pokedex[indexPath.row]
        
        
        //assing the value of pokemon into cell to be displayed
        cell.textLabel?.text = pokemon.name
        cell.detailTextLabel?.text = pokemon.element
        cell.imageView?.image = pokemon.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //get storyboard where the ViewController belong
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //instantiate the controller
        guard let controller = storyboard.instantiateViewController(withIdentifier: "PokemonDetailViewController") as? PokemonDetailViewController else {return}
        
        let selectedPokemon = pokedex[indexPath.row]
        
        //
        controller.pokemon = selectedPokemon
  
        navigationController?.pushViewController(controller, animated: true)
    }
    
}


