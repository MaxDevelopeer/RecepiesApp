//
//  NSObject+Extension.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var stringIdentifier: String {
        return String(describing: Self.self)
    }
    
}
