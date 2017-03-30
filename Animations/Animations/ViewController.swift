//
//  ViewController.swift
//  Animations
//
//  Created by Seow Yung Hoe on 24/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cloudImageView : UIImageView = UIImageView()
    var cardImageView : UIImageView = UIImageView()
    var button : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Define the frame and image
        let frame = CGRect(x: -100, y: 50, width: 100, height: 100)
        cloudImageView = UIImageView(frame: frame)
        cloudImageView.image = UIImage(named: "cloud")
        
        //add to ViewController
        view.addSubview(cloudImageView)
        
        let cardframe = CGRect(x: 50, y: view.frame.height - 200, width: 100, height: 150)
        cardImageView = UIImageView(frame:cardframe)
        cardImageView.image = UIImage(named: "diamond_K")
        view.addSubview(cardImageView)
        
        //allowed UserInteraction, so gesture can work
        cardImageView.isUserInteractionEnabled = true
        
        //add tap gesture to cardImageView
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        cardImageView.addGestureRecognizer(tap)
        
        //button
        let buttonSize = CGSize(width: 80, height: 80)
        let buttonFrame = CGRect(origin: view.center, size: buttonSize)
        button = UIButton(frame: buttonFrame)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        
        
    }
    
    func goToNextPage(){
        
        performSegue(withIdentifier: "toNextPage", sender: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //animation here
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            //moving the uiview / uiimageview
//            let destinationFrame = CGRect(x: self.view.frame.width + 100, y: self.cloudImageView.frame.origin.y, width: self.cloudImageView.frame.width, height: self.cloudImageView.frame.height)
//            
//            self.cloudImageView.frame = destinationFrame
            
            let destinationPoint = CGPoint(x: 200, y: 200)
            self.cloudImageView.frame.origin = destinationPoint

            
        }, completion: nil)
        
        
        
//        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
//          //animated button
//            self.button.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//        }, completion: nil)
    }
    
    func handleTap(_ sender : UITapGestureRecognizer){
        
        UIView.transition(with: cardImageView, duration: 4.0, options: .transitionFlipFromRight, animations: {
            self.cardImageView.image = UIImage(named: "diamond_Q")
            
            //Remove image once animation finish
        }, completion: {(finished) in
            
            self.cardImageView.removeFromSuperview()
            
        })
        
        
    }


}

