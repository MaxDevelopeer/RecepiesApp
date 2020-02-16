//
//  DietType.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


enum DietType: String {
    
    case balanced
    case highFiber = "high-fiber"
    case highProtein = "high-protein"
    case lowCarb = "low-carb"
    case lowFat = "low-fat"
    case lowSodium = "low-sodium"
    
    var description: String {
        switch self {
        case .balanced:
            return "Protein/Fat/Carb values in 15/35/50 ratio"
        case .highFiber:
            return "More than 5g fiber per serving"
        case .highProtein:
            return "More than 50% of total calories from proteins"
        case .lowCarb:
            return "Less than 20% of total calories from carbs"
        case .lowFat:
            return "Less than 15% of total calories from fat"
        case .lowSodium:
            return "Less than 140mg Na per serving"
        }
        
        
    }
    
    
}
