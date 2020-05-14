//
//  RecipeDetailViewController.swift
//  GoodEatins
//
//  Created by Abraham Lay (ID) on 14/05/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeDetailImage: UIImageView!
    
    @IBOutlet weak var recipeDetailTitle: UILabel!
    
    @IBOutlet weak var recipeDetailDescription: UILabel!
    
    var selectedRecipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeDetailImage.image = UIImage(named: selectedRecipe?.imageName ?? "salad1")
        recipeDetailTitle.text = selectedRecipe?.title
        recipeDetailDescription.text = selectedRecipe?.instructions
    }
    
}
