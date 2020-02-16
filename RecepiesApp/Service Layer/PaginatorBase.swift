//
//  Paginator.swift
//  RecepiesApp
//
//  Created by Maxim on 16/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

protocol PaginatorBase {
    
    var pageSize: Int { get }
    var currentPage: Int { get }
    
}
