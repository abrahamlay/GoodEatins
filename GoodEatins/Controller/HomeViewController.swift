//
//  ViewController.swift
//  GoodEatins
//
//  Created by Abraham Lay (ID) on 13/05/20.
//  Copyright © 2020 Abraham Lay (ID). All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let dataSet = DataSet()
    var categoryToPass :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell",for: indexPath) as? CategoryCell{
            cell.configureCell(foodCategory: dataSet.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = dataSet.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipeSelection", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeVC = segue.destination as? RecipeViewController{
            recipeVC.selectedCategory = categoryToPass
        }
    }
}

