//
//  Hits.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


struct RecipesList: Decodable{
    
    var recipesObjects: [RecipeObject]
    
    private enum CodingKeys: String, CodingKey {
        case recipesObjects = "hits"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        recipesObjects = try container.decode([RecipeObject].self, forKey: .recipesObjects)
    }
    
}

struct RecipeObject: Decodable {
    
    var recipe: Recipe
    
}

extension RecipesList: Deserializable {
    
    static func deserialize(with data: Data) -> RecipesList? {
        
        let decoder = JSONDecoder()
        return try? decoder.decode(RecipesList.self, from: data)
        
    }
    
}


