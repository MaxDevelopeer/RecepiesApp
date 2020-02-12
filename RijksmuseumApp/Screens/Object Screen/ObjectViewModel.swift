//
//  ObjectScreenViewModel.swift
//  RijksmuseumApp
//
//  Created by Maxim on 12/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation

class ObjectViewModel {
    
    private let object: CollectionObject
    
    init(object: CollectionObject) {
        self.object = object
    }
    
    var getObjectTitle: String {
        return object.artObject.title
    }
    
    var getObjectCreator: String {
        return object.artObject.creators.first?.name ?? ""
    }
    
    var getObjectDescription: String {
        return object.artObject.objectDescription
    }
    
    var getObjectImageStringUrl: String {
        return object.artObject.image.url
    }
    
    
}
