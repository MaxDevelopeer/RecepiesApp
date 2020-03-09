//
//  PageLoader.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

enum PageLoader {
    
    case fromStart
    case next
    
    
    func getPageParamsFor(currentPage: Int, pageSize: Int) -> (from: Int, to: Int) {
        switch self {
        case .fromStart:
            return (0, pageSize)
        case .next:
            let from = currentPage * pageSize
            let to = from + pageSize
            return(from, to)
        }
    }
    
}
