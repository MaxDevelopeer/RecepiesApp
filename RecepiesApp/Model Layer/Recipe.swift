//
//  ArtObject.swift
//  RecepiesApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


 struct Recipe: Decodable {

    let title: String
    let imageUrl: URL
    let calories: Float
    let totalWeight: Float
    let ingredients: [Ingredient]?
    let totalNutrients: Nutrients?
    let totalDaily: Nutrients?
    let dietLabels: [String]?
    let healthLabels: [String]?
    var image: UIImage?
    
    private enum CodingKeys: String, CodingKey {
        case title = "label"
        case imageUrl = "image"
        case calories
        case totalWeight
        case ingredients
        case totalNutrients
        case totalDaily
        case dietLabels
        case healthLabels
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        imageUrl = try container.decode(URL.self, forKey: .imageUrl)
        title = try container.decode(String.self, forKey: .title)
        calories = try container.decode(Float.self, forKey: .calories)
        totalWeight = try container.decode(Float.self, forKey: .totalWeight)
        ingredients = try container.decodeIfPresent([Ingredient].self, forKey: .ingredients)
        totalNutrients = try container.decodeIfPresent(Nutrients.self, forKey: .totalNutrients)
        totalDaily = try container.decodeIfPresent(Nutrients.self, forKey: .totalDaily)
        dietLabels = try container.decodeIfPresent([String].self, forKey: .dietLabels)
        healthLabels = try container.decodeIfPresent([String].self, forKey: .healthLabels)
        
    }
    
    static func deserializeArray(with data: Data) -> [Recipe]? {
        let decoder = JSONDecoder()
        return try? decoder.decode([Recipe].self, from: data)
    }
    
}



extension Recipe: Deserializable {
    
    static func deserialize(with data: Data) -> Recipe? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Recipe.self, from: data)
    }
    
}
