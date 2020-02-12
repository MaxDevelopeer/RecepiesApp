//
//  Deserializable.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


protocol Deserializable where Self : Decodable {
    
    static func deserialize (with data: Data) -> Self?
    
}

//
//init(with data: Data) throws {
//    let decoder = JSONDecoder()
//    self = try decoder.decode(Self.self, from: data)
//}
//
//static func initArrayOfObjects(with data: Data) throws -> [Self]  {
//    let decoder = JSONDecoder()
//    return try decoder.decode([Self].self, from: data)
//}
