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
    
}
