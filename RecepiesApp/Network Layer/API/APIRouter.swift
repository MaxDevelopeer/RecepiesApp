//
//  APIRouter.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation

 
enum APIRouter {
    
    case search(
        mainIngredient: String,
        from: Int,
        to: Int,
        dietType: DietType?,
        healthType: HealthType?
    )
    
    
    private var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    private var encodeType: EncodeType {
        switch self {
//        case .basicMultipartData:
//            return .MultipartDataEncode(parts: bodyParts, boundary: MultipartBoundary())
        default:
            return .URLEncode(params: params)
        }
    }
    
    private var timeoutInterval: TimeInterval {
        switch self {
//        case .basicMultipartData:
//            return 120
        default:
            return 40
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
