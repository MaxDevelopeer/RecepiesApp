//
//  RecipesService.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


class RecipesService: RecipesServiceBase {
    
    
    let pageSize: Int
    private(set) var currentPage: Int
    
    
    init(pageSize: Int) {
        self.pageSize = pageSize
        self.currentPage = 0
    }
    
    private let networkClient: NetworkClient = {
        var configuration = URLSessionConfiguration.default
        return NetworkClient(sessionConfiguration: configuration)
    }()
    
    
    func loadRecipesBy(request: URLRequest, completion: @escaping loadObjectsResult) {
        
        networkClient.requestFor(urlRequest: request) { [weak self] (result) in
            guard let self = self else { return }
            
            guard let data = result.successResult else {
                completion(.failure(result.unwrapFailureResult))
                return
            }
            
            guard let object = RecipesList.deserialize(with: data) else {
                completion(.failure(LoadingErrors.failedDeserializeCollectionObject))
                return
            }
            
            self.currentPage += 1
            completion(.success(object))
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
    
    
    func loadImageForObjectWith(url: URL, completion: @escaping loadImageResult) {
        
        let requestCreationResult = BaseNetworkRequestConstructor.requestUrl(urlAddress: url).asUrlRequest()
        
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
    
}
