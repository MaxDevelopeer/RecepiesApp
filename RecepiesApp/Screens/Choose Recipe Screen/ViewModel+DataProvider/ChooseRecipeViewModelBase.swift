//
//  ChooseRecipeViewModelBase.swift
//  RecepiesApp
//
//  Created by Maxim on 09/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

protocol ChooseRecipeViewModelBase: ViewModelBase {

    var mainIngredient: String? { get set }
    
    var choosenDietType: DietType? { get set }
    
    var choosenHealthType: HealthType? { get set }

    var choosenMealType: MealType? { get set }
    
    var choosenDishType: DishType? { get set }
    
    var dietTypes: [String] { get }
    
    var healthTypes: [String] { get }
    
    var mealTypes: [String] { get }
    
    var dishTypes: [String] { get }
    
    func getAmountOfItems(type: CollectionType) -> Int

}
