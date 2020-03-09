//
//  CollectionConfigurator.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

typealias closure = () -> ()

protocol CellConfigurator {
    
    associatedtype viewModel: ViewModelBase
    
    func configure (with viewModel: viewModel, at indexPath: IndexPath, completion: closure?)
    
}
