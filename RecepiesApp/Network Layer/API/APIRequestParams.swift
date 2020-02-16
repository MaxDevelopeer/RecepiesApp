//
//  HTTPRequestParameters.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension APIRouter {
    
    var params: Parameters {
        switch self {
        case .search(let params):
            
            return [
                "q": "\(params.mainIngredient)",
                "app_id" : ApiConfig.appId,
                "app_key" : ApiConfig.appKey,//,
                "from" : params.from,
                 "to" : params.to
               // "health" : params.healthType?.rawValue,
              //  "diet" : params.dietType?.rawValue
            ]
            
        }
    }
    
}
