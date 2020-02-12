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
    
    
    func encode(request: URLRequest) throws ->  URLRequest {
        
        var urlRequest = request
        
        switch self {
        case .JSONEncode(let params):
            
            guard let params = params else {
                return urlRequest
            }
            
            guard let data = try? JSONSerialization.data(withJSONObject: params,
                                                         options: .fragmentsAllowed) else {
                throw EncodingErrors.failedJSONEncodeParameters
            }
            
            urlRequest.httpBody = data
            
        case .URLEncode(let params):
            
            guard let params = params else {
               return urlRequest
            }
            
            guard let urlString = urlRequest.url?.absoluteString else {
                throw EncodingErrors.failedCreateStringUrl
            }
            
            guard var urlComponents = URLComponents(string: urlString) else {
                throw EncodingErrors.failedCreateUrlComponents
            }
            
            urlComponents.queryItems = params.createURLComponents()
            
            guard let url = urlComponents.url else {
                throw EncodingErrors.failedCreateUrlFromUrlComponents
            }
            
            urlRequest = URLRequest(url: url)
            
        case .MultipartDataEncode(let parts, let boundary):
            
            guard let parts = parts else {
                return urlRequest
            }
            
            urlRequest.httpBody = MultipartBody(boundary: boundary, parts: parts).getData()
        }
        
        return urlRequest
        
    }
    
}


extension EncodeType  {
    
    enum EncodingErrors: Error, LocalizedError {
        
        case failedCreateStringUrl
        case failedCreateUrlFromUrlComponents
        case failedCreateUrlComponents
        case failedJSONEncodeParameters
        case failedURLEncodeParameters
        
        public var localizedDescription: String {
            switch self {
            case .failedCreateStringUrl:
               return "Failed to create string from urlRequest url"
            case .failedCreateUrlFromUrlComponents:
                return "Failed to create url from urlComponents"
            case .failedCreateUrlComponents:
                return "Failed to create url components"
            case .failedJSONEncodeParameters:
                return "Failed encode parameters to JSON"
            case .failedURLEncodeParameters:
                return "Failed encode parameters to URL"
           
            }
        }
        
    }
    
}
