//
//  RecipeViewController.swift
//  GoodEatins
//
//  Created by Abraham Lay (ID) on 14/05/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    var selectedCategory: String?
    
    var recipes: [Recipe]?
    
    var recipeToPass: Recipe!
    
    let dataSet = DataSet()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        recipes = dataSet.getRecipes(forCategoryTitle: selectedCategory ?? "Burgers")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCollectionCell", for: indexPath) as? RecipeCell
        {
        let recipe = recipes?[indexPath.item]
        
            cell.configureCell(recipe: recipe!)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimension = (width/2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes?[indexPath.item]
        performSegue(withIdentifier: "toRecipeDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? RecipeDetailViewController{
            detailVC.selectedRecipe = recipeToPass
        }
    }
    
}
