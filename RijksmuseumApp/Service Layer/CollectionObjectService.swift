//
//  CollectionObjectService.swift
//  RijksmuseumApp
//
//  Created by Maxim on 11/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


class CollectionObjectService: CollectionObjectServiceProtocol {
    
    private let networkClient: NetworkClient = {
        var configuration = URLSessionConfiguration.default
        return NetworkClient(sessionConfiguration: configuration)
    }()
    
    
    func loadObjectWith(id: String, completion: @escaping loadObjectsResult) {
        
        let requestCreationResult = APIRouter.collectionObject(id: id).asUrlRequest()
        
        guard let request = requestCreationResult.successResult else {
            completion(.failure(requestCreationResult.unwrapFailureResult))
            return
        }
        
        networkClient.requestFor(urlRequest: request) { (result) in
            
            guard let data = result.successResult else {
                completion(.failure(result.unwrapFailureResult))
                return
            }
            
            guard let object = CollectionObject.deserialize(with: data) else {
                completion(.failure(LoadingErrors.failedDeserializeCollectionObject))
                return
            }
                
            completion(.success(object))
        }
            
    }
    
    
    func loadObjectImageWith(stringUrl: String, completion: @escaping loadImageResult) {
        
        let requestCreationResult = BaseNetworkRequestConstructor.requestUrlString(address: stringUrl).asUrlRequest()
        
        guard let request = requestCreationResult.successResult else {
            completion(.failure(requestCreationResult.unwrapFailureResult))
            return
        }
        
        networkClient.requestFor(urlRequest: request) { (result) in
            
            
            guard let data = result.successResult else {
                completion(.failure(result.unwrapFailureResult))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completion(.failure(LoadingErrors.failedCreateImageFromData))
                return
            }
            
            completion(.success(image))
            
        }
        
    }
    
    
    
    private enum LoadingErrors: Error, LocalizedError {
        
        case failedCreateImageFromData
        case failedDeserializeCollectionObject
        
        public var localizedDescription: String {
            
            switch self {
            case .failedCreateImageFromData:
                return "failed to create image from data"
            case .failedDeserializeCollectionObject:
                return "failed to deserialize collection object from data"
            }
        }
        
    }
    
    
}
