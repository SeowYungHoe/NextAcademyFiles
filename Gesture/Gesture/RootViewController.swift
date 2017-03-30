//
//  ViewController.swift
//  Gesture
//
//  Created by Seow Yung Hoe on 19/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit


//Custom Delegation step 4
class RootViewController: UIViewController, MovableImageViewDelegate {

  

    @IBOutlet var headImageView: [MovableImageView]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom Delegation step 5
        headImageView.forEach { (imageView) in imageView.delegate = self
            
        }
        
    }
    
    //Custom delegation step 6
    func didStartGesture(imageView: UIImageView) {
        //move the image view to top when gesture applied
        self.view.bringSubview(toFront: imageView)
    }

}

