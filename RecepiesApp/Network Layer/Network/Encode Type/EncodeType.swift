//
//  HTTPEncodeType.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


enum EncodeType {
    
    case URLEncode(params: Parameters?)
    case JSONEncode(params: Parameters?)
    case MultipartDataEncode(parts: [PartType]?, boundary: MultipartBoundary)
    
    
    
    var contentType: (String, String) {
        switch self {
        case .JSONEncode:
            return ("Content-Type", "application/json")
        case .URLEncode:
            return ("Content-Type", "application/x-www-form-urlencoded")
        case .MultipartDataEncode(let info):
            return ("Content-Type", "multipart/form-data; boundary=\(info.boundary)")
        }
    }
    
    
    func encode(request: URLRequest) -> Result <URLRequest,Error> {
        
        var urlRequest = request
        
        switch self {
        case .JSONEncode(let params):
            
            guard let params = params else {
                return .success(urlRequest)
            }
            
            guard let data = try? JSONSerialization.data(withJSONObject: params,
                                                         options: .fragmentsAllowed) else {
                return .failure(EncodingErrors.failedJSONEncodeParameters)
            }
            
            urlRequest.httpBody = data
            
        case .URLEncode(let params):
            
            guard let params = params else {
                return .success(urlRequest)
            }
            
            guard let urlString = urlRequest.url?.absoluteString else {
                return .failure(UrlErrors.failedCreateStringFromUrl)
            }
            
            guard var urlComponents = URLComponents(string: urlString) else {
                return .failure(UrlErrors.failedCreateUrlComponents)
            }
            
            urlComponents.queryItems = params.createURLComponents()
            
            guard let url = urlComponents.url else {
                return .failure(UrlErrors.failedCreateUrlFromUrlComponents)
            }
            
            urlRequest = URLRequest(url: url)
            
        case .MultipartDataEncode(let parts, let boundary):
            
            guard let parts = parts else {
                return .success(urlRequest)
            }
            
            urlRequest.httpBody = MultipartBody(boundary: boundary, parts: parts).getData()
        }
        
        return .success(urlRequest)
        
    }
    
}


extension EncodeType  {
    
    enum EncodingErrors: Error, LocalizedError {
        
      
        case failedJSONEncodeParameters
        case failedURLEncodeParameters
        
        public var localizedDescription: String {
            switch self {
            case .failedJSONEncodeParameters:
                return "Failed encode parameters to JSON"
            case .failedURLEncodeParameters:
                return "Failed encode parameters to URL"
           
            }
        }
        
    }
    
}
