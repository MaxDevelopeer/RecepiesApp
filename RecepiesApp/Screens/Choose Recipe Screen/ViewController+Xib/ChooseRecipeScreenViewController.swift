//
//  ChooseRecipeScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 02/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class ChooseRecipeScreenViewController: UIViewController {
    
    
    @IBOutlet private var ingredientTextField: UITextField? 
    
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        
        guard let mainIngredient = ingredientTextField?.text else { return }
        
        let loadRecipesParams = LoadRecipesParameters(mainIngredient: mainIngredient)
        
        let vc = ControllerFabric.recipesListViewController(itemsCount: 30, loadRecipesParameters: loadRecipesParams).instantiate()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    init() {
        super.init(nibName: ChooseRecipeScreenViewController.stringIdentifier, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
