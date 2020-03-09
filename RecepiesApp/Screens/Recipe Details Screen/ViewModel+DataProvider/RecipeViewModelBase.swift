//
//  RecipeViewModelBase.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


protocol RecipeViewModelBase {
    
    var recipe: Recipe { get }
    
    init(recipe: Recipe)
    
    var getRecipeImage: UIImage? { get }
    
    var getRecipeTitle: String { get }
    
    var getRecipeCalories: Int { get }
    
    var getRecipeWeight: Int { get }
    
    var getRecipeIngredientCount: Int { get }
    
    func getRecipeIngredient(on indexPath: IndexPath ) -> String
    
    func getHeightOfIngredientLabel(for indexPath: IndexPath, width: CGFloat) -> CGFloat
    
}
