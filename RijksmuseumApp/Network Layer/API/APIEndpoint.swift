//
//  APIEndpoint.swift
//  NetworkLayer
//
//  Created by Maxim on 25/01/2020.
//  Copyright © 2020 maxim.kruchinin@firstlinesoftware.com. All rights reserved.
//

import Foundation


extension APIRouter {
    
    var endpoint: String {
        switch self {
        case .posts:
            return "/posts"
        case .collectionObject(let id):
            return "/api/en/collection/\(id)"
        case .basicMultipartData:
            return "/exampleMultipart"
        }
    }
    
}
