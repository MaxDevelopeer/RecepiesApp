//
//  BaseNetworkRequestConstructor.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


enum BaseNetworkRequestConstructor: NetworkRequestConstructor {
    
    case requestUrlString (
        address: String
    )
    
    case requestUrl (
        urlAddress: URL
    )
    
    
    func asUrlRequest() -> Result<URLRequest,Error> {
        
        var urlRequest: URLRequest
        
        switch self {
        case .requestUrl(let url):
            urlRequest = URLRequest(url: url)
        case .requestUrlString(let address):
            guard let url = URL(string: address) else {
                return .failure(UrlErrors.failedCreateUrlFomString)
            }
            
            urlRequest = URLRequest(url: url)
        }
        
        return .success(urlRequest)
        
    }
    
    
}

enum UrlErrors: Error, LocalizedError {
    
    case failedCreateUrlFomString
    case failedCreateStringFromUrl
    case failedCreateUrlFromUrlComponents
    case failedCreateUrlComponents
    
    
    public var localizedDescription: String {
        switch self {
        case .failedCreateUrlFomString:
            return "Failed to create url from string"
        case .failedCreateStringFromUrl:
           return "Failed to create string from url"
        case .failedCreateUrlFromUrlComponents:
            return "Failed to create url from urlComponents"
        case .failedCreateUrlComponents:
            return "Failed to create url components"
        }
    }
    
    
}
