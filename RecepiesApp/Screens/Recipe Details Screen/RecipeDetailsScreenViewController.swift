//
//  RecipeDetailsScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim on 16/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipeDetailsScreenViewController: UIViewController {

    @IBOutlet private var recipesTableView: UITableView? {
        didSet {
            recipesTableView?.delegate = self
            recipesTableView?.dataSource = self
        }
    }
    @IBOutlet private var recipeDescriptionLabel: UILabel?
    @IBOutlet private var recipeImageView: UIImageView? {
        didSet {
            recipeImageView?.layer.cornerRadius = 5.0
        }
    }
    
    private let recipeViewModel: RecipeViewModel
    
    
    init(recipeViewModel: RecipeViewModel) {
        self.recipeViewModel = recipeViewModel
        super.init(nibName: RecipeDetailsScreenViewController.nibName, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeDescriptionLabel?.text = "Calories: \(recipeViewModel.getRecipeCalories)"
        recipeImageView?.image = recipeViewModel.getRecipeImage
        
        recipesTableView?.registerCell(type: RecipeDetailsScreenTableViewCell.self)
        
        configureNavigationBar()
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = recipeViewModel.getRecipeTitle
       
    }
    
}


extension RecipeDetailsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeViewModel.getRecipeIngredientCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.getReusableCell(type: RecipeDetailsScreenTableViewCell.self, to: indexPath) else {
            return UITableViewCell()
        }
        
        cell.recipesIngredientLabel?.text = recipeViewModel.getRecipeIngredient(on: indexPath)
        return cell
    }
    
    
    
}
