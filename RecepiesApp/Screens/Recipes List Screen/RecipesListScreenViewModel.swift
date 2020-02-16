//
//  RecipesListScreenViewModel.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


import Foundation
import UIKit

class RecipesListScreenViewModel {
    
    // MARK: Public Properties
    
    var itemsCount: Int {
        return object?.hits.count ?? 0
    }
    
    
    func getTitleForRecipe(at indexPath: IndexPath) -> String? {
            
        let index = indexPath.item
        
        guard let hits = object else {
            return nil
        }
        
        return hits.hits[index].recipe.title
    }
    

    func getRecipeViewModel(at indexPath: IndexPath) -> RecipeViewModel? {
        
        
        guard let recipe = object?.hits[indexPath.item].recipe else {
            return nil
        }
        
        return RecipeViewModel(recipe: recipe)
    }
    

    
    // MARK: Private Properties
    
    private var object: Hits?

    
    
    // MARK: Private Constants
    
    private var recipesService: RecipesServiceBase?
   
    
    
    // MARK: Init
    
    init(recipesService: RecipesServiceBase) {
        self.recipesService = recipesService
    }
    
    
    func loadImageForObject(at indexPath: IndexPath, completion: @escaping (UIImage?) -> ()) {
        
        guard let hits = object else {
            completion(nil)
            return
        }
        
        
        recipesService?.loadImageForObjectWith(url: hits.hits[indexPath.item].recipe.imageUrl) { (result) in

            guard let image = result.successResult else {
                print(result.unwrapFailureResult.localizedDescription)
                completion(nil)
                return
            }
            
            self.object?.hits[indexPath.item].recipe.image = image
            completion(image)
        }
        
    }
    
}


// MARK: Public Methods

extension RecipesListScreenViewModel {
    
    func loadRecipes(completion: @escaping () -> ()) {
        let requestTypeResult = APIRouter.search(mainIngredient: "ham", from: nil, to: nil, dietType: nil, healthType: nil).asUrlRequest()
        
        guard let request = requestTypeResult.successResult else {
            print(requestTypeResult.unwrapFailureResult.localizedDescription)
            return
        }
        
        recipesService?.loadRecipesBy(request: request) { (result) in
            
            guard let hits = result.successResult else {
                print(result.unwrapFailureResult.localizedDescription)
                return
            }
            
            self.object = hits
            completion()    
        }
        
    }
    
}
