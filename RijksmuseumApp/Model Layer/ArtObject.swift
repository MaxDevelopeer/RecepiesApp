//
//  ArtObject.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


final class ArtObject: Decodable {
    
    var objectNumber: String
    var title: String
    var image: ArtObjectImage
    var objectDescription: String
    var titles: [String]
    var longDescription: String
    var creator: [Creator]
    
    private enum CodingKeys: String, CodingKey {
        case objectNumber
        case title
        case image = "webImage"
        case objectDescription = "description"
        case titles
        case creator = "principalMakers"
        case longDescription = "plaqueDescriptionEnglish"
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        objectNumber = try container.decode(String.self, forKey: .objectNumber)
        title = try container.decode(String.self, forKey: .title)
        objectDescription = try container.decode(String.self, forKey: .objectDescription)
        titles = try container.decode([String].self, forKey: .titles)
        longDescription = try container.decode(String.self, forKey: .longDescription)
        objectNumber = try container.decode(String.self, forKey: .objectNumber)
        creator = try container.decode([Creator].self, forKey: .creator)
        image = try container.decode(ArtObjectImage.self, forKey: .image)
        
        
    }
    
}

//
//extension ArtObject: Deserializable {
//
//    convenience init(with data: Data) throws {
//        let decoder = JSONDecoder()
//        try decoder.decode(ArtObject.self, from: data)
//    }
//
//}
