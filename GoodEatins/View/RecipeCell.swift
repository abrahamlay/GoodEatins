//
//  RecipeCell.swift
//  GoodEatins
//
//  Created by Abraham Lay (ID) on 14/05/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImg: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImg?.layer.cornerRadius = 10
    }
    
    func configureCell(recipe : Recipe){
        recipeImg?.image = UIImage(named: recipe.imageName)
    }
}
