//
//  RawRepresentable+Extension.swift
//  RecepiesApp
//
//  Created by Maxim on 09/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


extension RawRepresentable where Self: CaseIterable {
    
    static var getAmountOfItems: Int {
        var itemsCount = 0
        for _ in Self.allCases { itemsCount += 1 }
        return itemsCount
    }
    
    static var getArrayOfAllValues: [Self] {
        var allItems = [Self]()
        for item in Self.allCases { allItems.append(item) }
        return allItems
    }
    
}
