//
//  Creator.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


class Creator: Decodable {
    
    var name: String
    var placeOfBirth: String
    var dateOfBirth: String
    var dateOfDeath: String?
    var placeOfDeath: String?
  
    private enum CodingKeys: String, CodingKey {
        case name
        case placeOfBirth
        case dateOfBirth
        case dateOfDeath
        case placeOfDeath
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        placeOfBirth = try container.decode(String.self, forKey: .placeOfBirth)
        dateOfBirth = try container.decode(String.self, forKey: .dateOfBirth)
        
        dateOfDeath = try container.decodeIfPresent(String.self, forKey: .dateOfDeath) ?? ""
        placeOfDeath = try container.decodeIfPresent(String.self, forKey: .placeOfDeath) ?? ""
        
    }
    
    
}
