//
//  DynamicAnimatorViewController.swift
//  Animations
//
//  Created by Seow Yung Hoe on 24/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class DynamicAnimatorViewController: UIViewController {
    
    var itemsButtons = [UIButton]()
    var dynamicAnimator : UIDynamicAnimator!
    var isMenuOpened = false
    //1.
    var btnMenu: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn1 = createButton(title: "Item A", color: .darkGray)
        let btn2 = createButton(title: "Item B", color: .cyan)
        let btn3 = createButton(title: "Item C", color: .green)
        let btn4 = createButton(title: "Item D", color: .blue)
        
        itemsButtons.append(btn1)
        itemsButtons.append(btn2)
        itemsButtons.append(btn3)
        itemsButtons.append(btn4)

        //2.
        btnMenu = createButton(title: "Menu", color: .red)

        btnMenu.addTarget(self, action: #selector(toogleMenu), for: .touchUpInside)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
    }

    func toogleMenu(){
        dynamicAnimator.removeAllBehaviors()
        if  isMenuOpened{
            closeMenu()
        }else{
            openMenu()
        }
        isMenuOpened = !isMenuOpened
    }
    
    func openMenu(){
        let button1 = itemsButtons[0]
        createSnapBehaviour(button: button1, x: -100, y: -100)
        
        let button2 = itemsButtons[1]
        createSnapBehaviour(button: button2, x: 100, y: -100)
        
        let button3 = itemsButtons[2]
        createSnapBehaviour(button: button3, x: -100, y: 100)

        let button4 = itemsButtons[3]
        createSnapBehaviour(button: button4, x: 100, y: 100)
        
    }
    
    func closeMenu(){
        
        let point = btnMenu.center
        
        for button in itemsButtons {
            let snap = UISnapBehavior(item: button, snapTo: point)
            
            dynamicAnimator.addBehavior(snap)
        }
        
    }

    func createSnapBehaviour(button: UIButton , x : CGFloat, y : CGFloat) {
        let snapPoint = CGPoint(x: button.center.x + x, y: button.center.y + y)
        let snap = UISnapBehavior(item: button, snapTo: snapPoint)
        
        
        //add behaviour to dynamicAnimator
        dynamicAnimator.addBehavior(snap)
        
    }

    
    func createButton(title : String, color : UIColor) -> UIButton {
        let size = CGSize(width: 60, height: 60)
        let frame = CGRect(origin: view.center, size: size)
        let button = UIButton(frame: frame)
        
        //move button to center of view
        button.center = view.center
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        
        //To make the button round
        button.layer.cornerRadius = button.frame.width / 2
        
        view.addSubview(button)
        
        return button
        
    }

}
