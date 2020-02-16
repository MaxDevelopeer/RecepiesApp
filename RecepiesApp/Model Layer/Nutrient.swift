//
//  Nutrients.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

struct Nutrient: Decodable {
    
    let label: String
    let quantity: Float
    let weightType: String
    
    private enum CodingKeys: String, CodingKey {
        case label
        case quantity
        case weightType = "unit"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        label = try container.decode(String.self, forKey: .label)
        quantity = try container.decode(Float.self, forKey: .quantity)
        weightType = try container.decode(String.self, forKey: .weightType)
        
    }
    
    
}
