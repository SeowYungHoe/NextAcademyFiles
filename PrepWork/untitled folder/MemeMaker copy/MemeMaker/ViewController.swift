//
//  ViewController.swift
//  MemeMaker
//
//  Created by Seow Yung Hoe on 06/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topCaptionSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        bottomCaptionSegmentedControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        changeLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Outlets

    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let topChoices = [
    CaptionOption(caption: "You know what's the word?",emoji: "❓"),
    CaptionOption(caption: "You know what I love?", emoji: "😍"),
    CaptionOption(caption: "When does it rain money?", emoji: "💵")
    ]
    
    let bottomChoices = [
        CaptionOption(caption: "Bird is the word", emoji: "🐦"),
        CaptionOption(caption: "Pretty Lady", emoji: "👯"),
        CaptionOption(caption: "When there is 'change' in weather", emoji: "💰")
    ]
    
    
    
//Actions

    @IBAction func segmentedControl(_ sender: AnyObject) {
        changeLabels()
    }
    
    func changeLabels() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        
        topCaptionLabel.text = topChoices[topIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    
}

