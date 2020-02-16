//
//  Deserializable.swift
//  RecepiesApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


protocol Deserializable where Self : Decodable {
    
    static func deserialize (with data: Data) -> Self?
    
}
