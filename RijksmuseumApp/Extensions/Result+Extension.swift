//
//  Result+Extension.swift
//  RijksmuseumApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


extension Result {
    
    private var resultTuple: (Success?, Error?) {
        switch self {
        case .success(let value):
            return (value, nil)
        case .failure(let error):
            return (nil, error)
        }
    }
    
    var successResult: Success? {
        return resultTuple.0
    }
    
    var failureResult: Error? {
        return resultTuple.1
    }
    
    var unwrapFailureResult: Error {
        return failureResult ?? Errors.unknownedError
    }
    
}


private extension Result {
    
    enum Errors: Error, LocalizedError {
        case unknownedError
        
        var localizedDescription: String {
            switch self {
            case .unknownedError:
                return "unknowned error was occured"
            }
        }
    }
    
}
