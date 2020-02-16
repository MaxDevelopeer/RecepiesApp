//
//  Serializable.swift
//  RecepiesApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


protocol Serialize {
    
    func serialize() -> Result <Data, Error>
    
}
