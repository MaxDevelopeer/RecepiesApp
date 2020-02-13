//
//  APIRouter.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


public enum APIRouter {
    
    case posts
    
    case collectionObject(
        id: String
    )
    
    case basicMultipartData(
        files: [PartType]
    )
    
    
    private var method: HTTPMethod {
        switch self {
        case .basicMultipartData:
            return .post
        default:
            return .get
        }
    }
    
    private var encodeType: EncodeType {
        switch self {
        case .basicMultipartData:
            return .MultipartDataEncode(parts: bodyParts, boundary: MultipartBoundary())
        default:
            return .URLEncode(params: params)
        }
    }
    
    private var timeoutInterval: TimeInterval {
        switch self {
        case .basicMultipartData:
            return 120
        default:
            return 20
        }
    }
    
}



extension APIRouter: NetworkRequestConstructor {
    
    public func asUrlRequest() -> Result <URLRequest, Error> {
        
        let resourse = ApiConfig.baseUrl + endpoint
        
        guard let url = URL(string: resourse) else {
            return (.failure(UrlErrors.failedCreateUrlFomString))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return encodeType.encode(request: urlRequest)
        
    }
    
    
}
