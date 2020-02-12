//
//  NetworkClient.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation


public typealias response = (Result <Data, Error>) -> ()

protocol NetworkClientProtocol {
    
    func requestFor(urlRequest: URLRequest, completion: @escaping response)
}
