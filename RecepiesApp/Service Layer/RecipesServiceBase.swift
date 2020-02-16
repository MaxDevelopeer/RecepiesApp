//
//  ArtObjectService.swift
//  RecepiesApp
//
//  Created by Maxim on 11/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

typealias loadObjectsResult = (Result<Hits, Error>) -> ()
typealias loadImageResult = (Result<UIImage?, Error>) -> ()

protocol RecipesServiceBase {
    
    mutating func loadRecipesBy(request: URLRequest, completion: @escaping loadObjectsResult)
    func loadImageForObjectWith(url: URL, completion: @escaping loadImageResult)
    
}



