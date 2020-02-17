//
//  RecipeDetailsScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim on 16/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipeDetailsScreenViewController: UIViewController {

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
        
        configureNavigationBar()
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = recipeViewModel.getRecipeTitle
       
    }
    
    
}
