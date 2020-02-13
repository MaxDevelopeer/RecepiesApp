//
//  Dictionary + Extension.swift
//  RijksmuseumApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    func createURLComponents() -> [URLQueryItem] {
        return self.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
    
}
