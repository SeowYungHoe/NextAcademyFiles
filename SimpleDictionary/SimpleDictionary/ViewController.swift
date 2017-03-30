//
//  ViewController.swift
//  SimpleDictionary
//
//  Created by Seow Yung Hoe on 23/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
//Outlets
    @IBOutlet weak var sortBarButton: UIBarButtonItem! {
        didSet {
            sortBarButton.target = self
            sortBarButton.action = #selector(sortDictionary)
        }
    }
    
    @IBOutlet weak var shuffleBarButton: UIBarButtonItem! {
        
        
        didSet {
            shuffleBarButton.target = self
            shuffleBarButton.action = #selector(shuffleDictionary)
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    //Var
    var dictionaryItems:  [String] = []
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the path to the file
        if let dictionaryFile = Bundle.main.path(forResource: "10000_random_words", ofType: "plist") {
        
            let tempArray = NSArray(contentsOfFile: dictionaryFile) as? [String] ?? []
            
            dictionaryItems.append(contentsOf: tempArray)
            tableView.reloadData()
        
            
            
        }
        
        //read data from UserDefault
        let firstLaunch = !UserDefaults.standard.bool(forKey: "launched")
        if firstLaunch {
            let imageView = UIImageView(frame: view.frame)
            imageView.image = UIImage(named: "PUTINWINK")
            view.addSubview(imageView) // add view programatically
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
            imageView.addGestureRecognizer(tapGesture)
            imageView.isUserInteractionEnabled = true

        }
    }

//functions
    func shuffleDictionary() {
        shuffle(dictionary: dictionaryItems) {
            (shuffledDictionary) in
            dictionaryItems = shuffledDictionary
            
            
            tableView.reloadData()
            
            
        }
    }
    
    
    
    func shuffle(dictionary: [String], completion:(_ shuffledDictionary:[String]) -> Void){
        
        var shuffledDictionary = dictionary
        
        //process start
        let totalItem = dictionary.count-1
        for i in 0 ... totalItem {
            
            let randomInteger = Int(arc4random())
            let randomIndex = i + randomInteger % (totalItem+1 - i)
            shuffledDictionary[i] = dictionary[randomIndex]
        }
        
        //process end
        
        completion(shuffledDictionary)
        
    }
    
    
    
    func sortDictionary() {
        let sortedDictionary = dictionaryItems.sorted()
        dictionaryItems = sortedDictionary
        tableView.reloadData()
        
        }
    func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
        //to set data to UserDefault
        UserDefaults.standard.set(true, forKey: "launched")
        //to save data which was set earlier to UserDefault
        UserDefaults.standard.synchronize()
        
        //remove view programatically
        sender.view?.removeFromSuperview()
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //get the string on particular row
        let title = dictionaryItems[indexPath.row]
        cell.textLabel?.text = title
        
        return cell
    }
}
