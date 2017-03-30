//
//  ViewController.swift
//  FoodViewer
//
//  Created by Seow Yung Hoe on 09/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Going to a new page")
        print(segue.identifier!)
        
        var imageToShow: UIImage!
        
        if segue.identifier == "NasiLemakSegue"{
            print("got nasi lemak")
            imageToShow = UIImage(named: "nasi_lemak")
        }else if segue.identifier == "SataySegue"{
            print("got satay")
            imageToShow = UIImage(named: "satay")
        }else{
            print("got roti canai")
            imageToShow = UIImage(named: "roti_canai")
        }
        
        if let secondPage = segue.destination as?
            ImageViewController{
            secondPage.passedImage = imageToShow
        
    }

}

}
