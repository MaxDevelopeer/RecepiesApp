//
//  HealthType.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

enum HealthType: String {
    
    case alcoholFree = "alcohol-free"
    case celeryFree = "celery-free"
    case crustceanFree = "crustacean-free"
    case dairyFree = "dairy-free"
    case eggsFree = "egg-free"
    case fodmapFree = "fodmap-free"
    case glutenFree = "gluten-free"
    case ketoFriendly = "keto-friendly"
    case kosher
    case lowFatAbs = "low-fat-abs"
    case oilFree = "No-oil-added"
    case lowSugar = "low-sugar"
    case vegan
    case vegetarian
    
    
    var description: String {
        switch self {
        case .alcoholFree:
            return  "No alcohol used or contained"
        case .celeryFree:
            return  "Does not contain celery or derivatives"
        case .crustceanFree:
            return  "does not contain crustaceans (shrimp, lobster etc.) or derivatives"
        case .dairyFree:
            return  "No dairy; no lactose"
        case .eggsFree:
            return  "No eggs or products containing eggs"
        case .glutenFree:
            return  "No ingredients containing gluten"
        case .fodmapFree:
            return  "Does not contain FODMAP foods"
        case .ketoFriendly:
            return  "Maximum 7 grams of net carbs per serving"
        case .kosher:
            return  "contains only ingredients allowed by the kosher diet. However it does not guarantee kosher preparation of the ingredients themselves"
        case .lowFatAbs:
            return  "Less than 3g of fat per serving"
        case .oilFree:
            return  "No oil added except to what is contained in the basic ingredients"
        case .lowSugar:
            return  "No simple sugars – glucose, dextrose, galactose, fructose, sucrose, lactose, maltose"
        case .vegan:
            return  "No meat, poultry, fish, dairy, eggs or honey"
        case .vegetarian:
            return  "No meat, poultry, or fish"
        }
    }
}
