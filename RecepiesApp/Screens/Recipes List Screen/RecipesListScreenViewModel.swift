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
        return recipesLists.reduce(0) { $0 + $1.recipesObjects.count }
    }
    
    private func recipesListIndex(for index: Int) -> Int {
        
        if index < recipesService.pageSize && itemsCount >= index {
            return 0
        }
        
        let listIndex = index / recipesService.pageSize
        
        return listIndex
    
    }
    
    
    func getTitleForRecipe(at indexPath: IndexPath) -> String? {
        
        guard itemsCount >= indexPath.item else { return nil }
        
        let index = indexPath.item - recipesListIndex(for: indexPath.item) * recipesService.pageSize
        
        let listIndex = recipesListIndex(for: indexPath.item)
        
        return recipesLists[listIndex].recipesObjects[index].recipe.title
    }
    

    func getRecipeViewModel(at indexPath: IndexPath) -> RecipeViewModel? {
        
        guard itemsCount >= indexPath.item else { return nil }
        
        let listIndex = recipesListIndex(for: indexPath.item)
        
        let index = indexPath.item - recipesListIndex(for: indexPath.item) * recipesService.pageSize
        
        let recipe = recipesLists[listIndex].recipesObjects[index].recipe
        
        return RecipeViewModel(recipe: recipe)
    }
    

    
    // MARK: Private Properties
    
    private var recipesLists = [RecipesList]()

    
    
    // MARK: Private Constants
    
    private let recipesService: RecipesServiceBase
   
    
    
    // MARK: Init
    
    init(recipesService: RecipesServiceBase) {
        self.recipesService = recipesService
    }
    
    
    func loadImageForObject(at indexPath: IndexPath, completion: @escaping (UIImage?) -> ()) {
        
        let index = indexPath.item - recipesListIndex(for: indexPath.item) * recipesService.pageSize
        
         
        
        let listIndex = recipesListIndex(for: indexPath.item)
        
        guard itemsCount >= (index + listIndex * recipesService.pageSize) else {
            completion(nil)
            return
        }
               
        let recipeUrl = recipesLists[listIndex].recipesObjects[index].recipe.imageUrl
        
        recipesService.loadImageForObjectWith(url: recipeUrl) { (result) in

            guard let image = result.successResult else {
                print(result.unwrapFailureResult.localizedDescription)
                completion(nil)
                return
            }
            
            self.recipesLists[listIndex].recipesObjects[index].recipe.image = image
            completion(image)
        }
        
    }
    
}


// MARK: Public Methods

extension RecipesListScreenViewModel {
    
    func loadRecipes(page: PageLoader, completion: @escaping () -> ()) {
        
        let pageParams = page.getPageParamsFor(currentPage: recipesService.currentPage, pageSize: recipesService.pageSize)
        
        let requestTypeResult = APIRouter.search(mainIngredient: "chicken",
                                                 from: pageParams.from,
                                                 to: pageParams.to,
                                                 dietType: nil,
                                                 healthType: nil).asUrlRequest()
        
        guard let request = requestTypeResult.successResult else {
            print(requestTypeResult.unwrapFailureResult.localizedDescription)
            return
        }
        
        recipesService.loadRecipesBy(request: request) { (result) in
            
            guard let recipesList = result.successResult else {
                print(result.unwrapFailureResult.localizedDescription)
                return
            }
            
            self.recipesLists.append(recipesList)
            completion()    
        }
        
    }
    
    func getIndexPathsForNewItems() -> [IndexPath] {
        
        let from = (recipesService.currentPage - 1) * recipesService.pageSize
        let to = from + recipesLists[recipesService.currentPage - 1].recipesObjects.count //recipesService.pageSize
        
        var indexPaths = [IndexPath]()
        
        for index in from..<to {
            indexPaths.append(IndexPath(item: index, section: 0))
        }
        
        return indexPaths
      
        
    }
    
    
    enum PageLoader {
        
        case fromStart
        case next
        
        
        // FIXME:- fix this hardcode
        func getPageParamsFor(currentPage: Int, pageSize: Int) -> (from: Int, to: Int) {
            switch self {
            case .fromStart:
                return (0, pageSize)
            case .next:
                let from = currentPage * pageSize
                let to = from + pageSize
                return(from, to)
            }
            
        }
        
    }
    
}
