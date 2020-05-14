//
//  CategoryCell.swift
//  GoodEatins
//
//  Created by Abraham Lay (ID) on 13/05/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import SwiftUI

class CategoryCell : UITableViewCell {
    
    @IBOutlet weak var categoryImg: UIImageView?
    @IBOutlet weak var categoryLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImg?.layer.cornerRadius = 10
        
    }
    
    func configureCell(foodCategory: FoodCategory){
        categoryImg?.image = UIImage(named: foodCategory.imageName)
        categoryLabel?.text = foodCategory.title
    }
}

