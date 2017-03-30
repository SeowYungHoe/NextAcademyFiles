//
//  MenuCell.swift
//  FoodMenu
//
//  Created by Seow Yung Hoe on 18/01/2017.
//  Copyright © 2017 Seow Yung Hoe. All rights reserved.
//

import UIKit

protocol MenuCellDelegate: class {
    
    func didSelectFood(image: UIImage?)
    func didSelectDrink(image: UIImage?)
}

//declare custom delegate
class MenuCell: UITableViewCell {

    weak var delegate : MenuCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func foodSelected(_ sender: UIButton!) {
        delegate?.didSelectFood(image: sender.currentImage)
    }
    
    @IBAction func drinkSelected(_ sender: UIButton!) {
        delegate?.didSelectDrink(image: sender.currentImage)
    }
    

}
