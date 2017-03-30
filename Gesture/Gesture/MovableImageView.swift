//
//  MovableImageView.swift
//  Gesture
//
//  Created by Seow Yung Hoe on 19/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

//Custom Delegation Step 1
protocol MovableImageViewDelegate {
    func didStartGesture(imageView: UIImageView)
}

class MovableImageView: UIImageView, UIGestureRecognizerDelegate {
    
    //Custom Delegation Step 2
    var delegate : MovableImageViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        print("head created")
        
        self.isUserInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.addGestureRecognizer(pan)
        pan.delegate = self
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlepinch(_:)))
        addGestureRecognizer(pinch)
        pinch.delegate = self
        
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        addGestureRecognizer(rotation)
        rotation.delegate = self
    }

    func handlePan(_ gesture : UIPanGestureRecognizer){
//        print("pan")
        
        if gesture.state == .began || gesture.state == .changed {
            
            if gesture.state == .began {
                delegate?.didStartGesture(imageView: self)
            }
            
            //get the change of X and change of Y relative to its original point
            let translation = gesture.translation(in: self)
            print ( translation)
            
            //move the view according to the translation
            self.transform = self.transform.translatedBy(x: translation.x, y: translation.y)
//            CGAffineTransform(translationX: translation.x, y: translation.y)
            //set the change of X and change of y to (0,0)
            gesture.setTranslation(CGPoint.zero, in: self)
        }
        
//        else if gesture.state == .ended {
//            //do sth
//        }
    }
    
    func handlepinch(_ gesture : UIPinchGestureRecognizer){
        
        if gesture.state == .began || gesture.state == .changed {
            
            if gesture.state == .began {
                delegate?.didStartGesture(imageView: self)
            }
            //scale the image
            
            //get the scale
            let scale = gesture.scale
            
            
            self.transform = self.transform.scaledBy(x: scale, y: scale)
            //set the scale to origin (1)
            gesture.scale = 1.0
        }
        
    }
    
    func handleRotation(_ gesture : UIRotationGestureRecognizer) {
        
        if gesture.state == .began || gesture.state == .changed {
            
            if gesture.state == .began {
                delegate?.didStartGesture(imageView: self)
            }
            
            //rotate the view
            
            //get the rotation
            let rotation = gesture.rotation
            
            //rotate the view
            self.transform = self.transform.rotated(by: rotation)
            
            //set rotation back to origin
            gesture.rotation = 0.0
            
        }
    }
    
    //Custom Delegation Step 3  (gesture move simultaneously)
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
