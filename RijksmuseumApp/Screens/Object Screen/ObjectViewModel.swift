//
//  ObjectScreenViewModel.swift
//  RijksmuseumApp
//
//  Created by Maxim on 12/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

class ObjectViewModel {
    
    // MARK: Public Properties
    
    var loadedCompletion: (() -> ())?
    
    var getObjectTitle: String? {
        return object?.artObject.title
    }
    
    var getObjectCreator: String? {
        return object?.artObject.creators.first?.name
    }
    
    var getObjectDescription: String? {
        return object?.artObject.objectDescription
    }
    
    private(set) var objectImage: UIImage? {
        didSet {
            loadedCompletion?()
        }
    }
    
    
    // MARK: Private Properties
    
    private var object: CollectionObject? {
        didSet {
            loadImageForObject()
        }
    }
    
    
    // MARK: Private Constants
    
    private let collectionObjectService: CollectionObjectServiceProtocol
    
    private let objectId: String
    
    
    // MARK: Init
    
    init(collectionObjectService: CollectionObjectServiceProtocol, objectId: String) {
        self.collectionObjectService = collectionObjectService
        self.objectId = objectId
    }
    
}


// MARK: Public Methods

extension ObjectViewModel {
    
    func loadObjectWith() {
        
        collectionObjectService.loadObjectWith(id: objectId) { [weak self] (result) in
            
            guard let self = self else { return }
            
            guard let object = result.successResult else {
                print(result.unwrapFailureResult.localizedDescription)
                return
            }
            
            self.object = object
        }
        
    }
    
}


// MARK: Private Methods

private extension ObjectViewModel {
    
    func loadImageForObject() {
        
        guard let object = object else { return }
        self.collectionObjectService.loadObjectImageWith(stringUrl: object.artObject.image.url) { (result) in
            
            guard let image = result.successResult else {
                print(result.unwrapFailureResult.localizedDescription)
                return
            }
            
            self.objectImage = image
        }
        
    }
    
}
