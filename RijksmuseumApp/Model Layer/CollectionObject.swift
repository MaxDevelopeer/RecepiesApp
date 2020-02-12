//
//  CollectionObject.swift
//  RijksmuseumApp
//
//  Created by Maxim on 10/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


final class CollectionObject: Decodable {
    
    var artObject: ArtObject
    
    private enum CodingKeys: String, CodingKey {
        case artObject
        
    }
    
    
    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        artObject = try container.decode(ArtObject.self, forKey: .artObject)
       
    }
    
    
}


extension CollectionObject: Deserializable {
    
    static func deserialize(with data: Data) -> CollectionObject? {
        let decoder = JSONDecoder()
        return try? decoder.decode(CollectionObject.self, from: data)
    }
    
}
