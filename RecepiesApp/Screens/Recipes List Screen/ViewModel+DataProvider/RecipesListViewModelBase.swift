//
//  RecipesListViewModelBase.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

typealias recipesLoadCompletion = () -> ()
typealias imageLoadCompletion = (UIImage?) -> ()


protocol RecipesListViewModelBase: ViewModelBase {
    
    var itemsCount: Int { get }
    
    var recipesLists: [RecipesList] { get }
    
    init(recipesService: RecipesServiceBase)
    
    func getTitleForRecipe(at indexPath: IndexPath) -> String?
    
    func getRecipeViewModel(at indexPath: IndexPath) -> RecipeViewModel?
    
    func loadImageForObject(at indexPath: IndexPath, completion: @escaping imageLoadCompletion)
    
    func loadRecipes(page: PageLoader, completion: @escaping recipesLoadCompletion)
    
    func getIndexPathsForNewItems() -> [IndexPath]
    
}
