//
//  ViewController.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionService = CollectionObjectService()
        
        do {
        try collectionService?.loadObjectWith(id: "SK-C-5", completion: { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let object):
                print(object.artObject.longDescription)
            }
        })
        } catch (let error) {
            print(error.localizedDescription)
        }
        
        
     //   let decoder =
       // decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
       // CollectionObject(from: )//(from: )
//        let data = str.data(using: .utf8)
//
//        let decoder = JSONDecoder()
//        let object = try! decoder.decode(CollectionObject.self, from: data!)
//        print(object.artObject.longDescription)
    }

    

}

