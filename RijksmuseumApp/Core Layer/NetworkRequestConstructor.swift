//
//  RequestConstructor.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


protocol NetworkRequestConstructor {
    
    func asUrlRequest() -> Result <URLRequest, Error>
    
}
