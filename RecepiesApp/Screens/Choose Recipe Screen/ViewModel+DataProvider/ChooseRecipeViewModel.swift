//
//  ChooseRecipeViewModel.swift
//  RecepiesApp
//
//  Created by Maxim on 09/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

class ChooseRecipeViewModel: ChooseRecipeViewModelBase {
    
    
    let dietTypes = DietType.getArrayOfAllValues.map { $0.rawValue }

    let healthTypes = HealthType.getArrayOfAllValues.map { $0.rawValue }
    
    let mealTypes = MealType.getArrayOfAllValues.map { $0.rawValue }
    
    let dishTypes = DishType.getArrayOfAllValues.map { $0.rawValue }
    
    
    var choosenDietType: DietType?
    
    var choosenHealthType: HealthType?
    
    var choosenMealType: MealType?
    
    var choosenDishType: DishType?
    
    var mainIngredient: String?
    
    
    func getAmountOfItems(type: CollectionType) -> Int {
        switch type {
        case .dietCollection:
            return DietType.getAmountOfItems
        case .dishCollection:
            return DishType.getAmountOfItems
        case .healthCollection:
            return HealthType.getAmountOfItems
        case .mealCollection:
            return MealType.getAmountOfItems
        }
    }
    
}

enum CollectionType {

    case dietCollection
    case healthCollection
    case mealCollection
    case dishCollection
    
}
