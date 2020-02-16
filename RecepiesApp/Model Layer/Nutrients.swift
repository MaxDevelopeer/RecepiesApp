//
//  Nutrients.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

struct Nutrients: Decodable {
    
    let calcium: Nutrient?
    let energy: Nutrient?
    let fat: Nutrient?
    let thiamin: Nutrient?
    let vitaminE: Nutrient?
    let vitaminA: Nutrient?
    let vitaminC: Nutrient?
    let vitaminD: Nutrient?
    let vitaminB6: Nutrient?
    
    private enum CodingKeys: String, CodingKey {
        
        case calcium = "CA"
        case energy = "ENERC_KCAL"
        case fat = "FAT"
        case thiamin = "THIA"
        case vitaminE = "TOCPHA"
        case vitaminA = "VITA_RAE"
        case vitaminC = "VITC"
        case vitaminD = "VITD"
        case vitaminB6 = "VITB6A"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        fat = try container.decodeIfPresent(Nutrient.self, forKey: .fat)
        calcium = try container.decodeIfPresent(Nutrient.self, forKey: .calcium)
        energy = try container.decodeIfPresent(Nutrient.self, forKey: .energy)
        thiamin = try container.decodeIfPresent(Nutrient.self, forKey: .thiamin)
        vitaminE = try container.decodeIfPresent(Nutrient.self, forKey: .vitaminE)
        vitaminA = try container.decodeIfPresent(Nutrient.self, forKey: .vitaminA)
        vitaminC = try container.decodeIfPresent(Nutrient.self, forKey: .vitaminC)
        vitaminD = try container.decodeIfPresent(Nutrient.self, forKey: .vitaminD)
        vitaminB6 = try container.decodeIfPresent(Nutrient.self, forKey: .vitaminB6)
        
    }
    
}
