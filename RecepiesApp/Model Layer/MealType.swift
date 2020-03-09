//
//  MealType.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

//struct RecipeRequestParameters {
    
    enum MealType: String, CaseIterable {
        
        case breakfast
        case lunch
        case dinner
        case snack
        
        static var amountOfItems: Int {
            return 4
        }
        
    }
    

    
enum DishType: String, CaseIterable {
    
    case bread
    case cereals
    case sauces = "Condiments and sauces"
    case drinks
    case desserts
    case main = "Main course"
    case pancake
    case preps
    case preserve
    case salad
    case sandwiches
    case side = "Side dish"
    case soup
    case starter
    case sweets
    
    static var amountOfItems: Int {
        return 15
    }
    
    static var dishTypes: [String] = {
        var items = [String]()
        for item in Self.allCases {
            items.append(item.rawValue)
        }
        return items
    }()
    
}
    
    
//}
