//
//  ArtObjectService.swift
//  RijksmuseumApp
//
//  Created by Maxim on 11/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

typealias loadObjectsResult = (Result<ObjectViewModel, Error>) -> ()
typealias loadImageResult = (Result<UIImage, Error>) -> ()

protocol CollectionObjectServiceProtocol: class {
    
    func loadObjectWith(id: String, completion: @escaping loadObjectsResult) throws
    
    func loadObjectImageWith(stringUrl: String, completion: @escaping loadImageResult) throws
    
}



