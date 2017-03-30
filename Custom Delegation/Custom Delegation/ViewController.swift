//
//  ViewController.swift
//  Custom Delegation
//
//  Created by Seow Yung Hoe on 18/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit


class Picture {
    
    var image: UIImage?
    var frameColor: UIColor = UIColor.black
    
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var picturesArray: [Picture] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        createPictures()
    }
    
    
    //CollectionView Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesArray.count + 1
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //assume have n images
        //cell no 1 : image
        //cell no n : image
        //cell no n+1 : slider
        //if indexpath <= n
        //use cell type 1
        //else
        //use cell type 2
        
        
        if indexPath.row <= picturesArray.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homuIdentifier", for: indexPath) as! PictureCollectionViewCell
            
            
            let display = picturesArray[indexPath.row]
            cell.homuImageView.image = display.image
            
            return cell
        }
        else {
            
            
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonidentifier", for: indexPath)
            
            if let cells = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as? SliderView
            {
                cell1.addSubview(cells)
            }
            
            return cell1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    
    
    //Functions
    
    func createPictures() {
        
        
        let homu = Picture()
        homu.image = UIImage(named: "Homu")
        homu.frameColor = UIColor.black
        picturesArray.append(homu)
        
        let neo = Picture()
        neo.image = UIImage(named: "Neostone")
        
        
        picturesArray.append(neo)
        
        let psaa = Picture()
        psaa.image = UIImage(named: "Psa")
        
        picturesArray.append(psaa)
        
        let und = Picture()
        und.image = UIImage(named: "Undine")
        
        picturesArray.append(und)
        
        let cvr = Picture()
        cvr.image = UIImage(named: "chowvsraki")
        
        picturesArray.append(cvr)
        
        
    }
    
    
    
}

