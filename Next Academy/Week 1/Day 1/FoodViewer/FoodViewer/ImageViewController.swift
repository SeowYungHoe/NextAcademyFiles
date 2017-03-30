//
//  ImageViewController.swift
//  FoodViewer
//
//  Created by Seow Yung Hoe on 09/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var passedImage: UIImage!
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.passedImage
    

       
    }

}
