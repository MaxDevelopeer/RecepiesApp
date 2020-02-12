//
//  ArtObjectService.swift
//  RijksmuseumApp
//
//  Created by Maxim on 11/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

typealias loadObjectsResult = (Result<CollectionObject, Error>) -> ()

protocol CollectionObjectServiceProtocol: class {
    
    func loadObjectWith(id: String, completion: @escaping loadObjectsResult) throws 
    
}



