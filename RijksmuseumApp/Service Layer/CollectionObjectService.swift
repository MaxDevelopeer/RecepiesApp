//
//  CollectionObjectService.swift
//  RijksmuseumApp
//
//  Created by Maxim on 11/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


class CollectionObjectService: CollectionObjectServiceProtocol {
   
    
    
    private let networkClient: NetworkClient = {
        var configuration = URLSessionConfiguration.default
        return NetworkClient(sessionConfiguration: configuration)
    }()
    
    
    func loadObjectWith(id: String, completion: @escaping loadObjectsResult) throws {
        let request = try APIRouter.collectionObject(id: id).asUrlRequest()
        
        networkClient.requestFor(urlRequest: request) { (result) in
            
            switch result {
                
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let object = CollectionObject.deserialize(with: data) {
                    completion(.success(object))
                }
            }
            
        }
    }
    
    
    func loadObjectImageWith(stringUrl: String, completion: @escaping loadImageResult) throws {
         let url = URL(string: stringUrl)!
        networkClient.requestFor(urlRequest: <#T##URLRequest#>, completion: <#T##response##response##(Result<Data, Error>) -> ()#>)
    }
    
    
}
