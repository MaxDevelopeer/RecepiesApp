//
//  ControllersFabric.swift
//  RecepiesApp
//
//  Created by Maxim on 09/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

enum ControllerFabric {
    
    case recipeDetailsViewController(viewModel: RecipeViewModelBase)
    case chooseReipeViewController
    case recipesListViewController(itemsCount: Int)
    
    func instantiate() -> UIViewController {
        switch self {
        case .chooseReipeViewController:
            return ChooseRecipeScreenViewController()
        case .recipeDetailsViewController(let viewModel):
            return RecipeDetailsScreenViewController(recipeViewModel: viewModel)
        case .recipesListViewController(let itemsCount):
            let service = RecipesService(pageSize: itemsCount)
            let viewModel = RecipesListScreenViewModel(recipesService: service)
            return RecipesListScreenViewController(recipesListScreenViewModel: viewModel)
        }
    }
    
}
