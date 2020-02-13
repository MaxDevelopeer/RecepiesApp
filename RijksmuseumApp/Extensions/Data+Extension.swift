//
//  Data + Extension.swift
//  RijksmuseumApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

extension Data {
    
    func debugInfo() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] else { return }
        let jsonString = String(decoding: self, as: UTF8.self)
        
        print("jsonObject: ", jsonObject)
        print("jsonString:", jsonString)
    }
    
}
