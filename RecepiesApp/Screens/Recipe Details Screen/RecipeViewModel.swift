//
//  RecipeViewModel.swift
//  RecepiesApp
//
//  Created by Maxim on 16/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


class RecipeViewModel {
    
    private let recipe: Recipe
    
    var getRecipeImage: UIImage? {
        return recipe.image ?? nil
    }
    
    var getRecipeTitle: String {
        return recipe.title
    }
    
    var getRecipeCalories: Int {
        return Int(recipe.calories)
    }
    
    var getRecipeWeight: Int {
        return Int(recipe.totalWeight)
    }
    
    var getRecipeIngredientCount: Int {
        return recipe.ingredients?.count ?? 0
    }
    
    func getRecipeIngredient(on indexPath: IndexPath ) -> String {
        return "• " + (recipe.ingredients?[indexPath.row].text ?? "")
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func getHeightOfIngredientLabel(for indexPath: IndexPath, width: CGFloat) -> CGFloat? {
        guard let text = recipe.ingredients?[indexPath.row].text else { return nil }
        return text.heightWithConstrainedWidth(width: width - 50.0, font: UIFont(name: "HelveticaNeue", size: 17.0)!)
    }
    
    
}
