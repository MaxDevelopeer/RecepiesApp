//
//  ObjectScreenViewModel.swift
//  RecepiesApp
//
//  Created by Maxim on 12/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//
//
//import Foundation
//import UIKit
//
//class ObjectViewModel {
//
//    // MARK: Public Properties
//
//    var loadedCompletion: (() -> ())?
//
////    var getObjectTitle: String? {
////        return object?.artObject.title
////    }
////
////    var getObjectCreator: String? {
////        return object?.artObject.creators.first?.name
////    }
////
////    var getObjectDescription: String? {
////        return object?.artObject.objectDescription
////    }
//
//    private(set) var objectImage: UIImage? {
//        didSet {
//            loadedCompletion?()
//        }
//    }
//
//
//    // MARK: Private Properties
//
//    private var object: RecipesList?
////    {
////        didSet {
////            loadImageForObject()
////        }
////    }
//
//
//    // MARK: Private Constants
//
//    private var collectionObjectService: RecipesServiceBase?
//
//  //  private let objectId: String
//
//
//    // MARK: Init
//
//    init(collectionObjectService: RecipesServiceBase) {
//        self.collectionObjectService = collectionObjectService
//       // self.objectId = objectId
//    }
//
//}
//
//
//// MARK: Public Methods
//
//extension ObjectViewModel {
//
//    func loadObjectWith() {
//        let request = APIRouter.search(mainIngredient: "ham", from: 0, to: 10, dietType: nil, healthType: nil).asUrlRequest()
//
//        guard let request1 = request.successResult else {
//            print(request.unwrapFailureResult.localizedDescription)
//            return
//        }
//
//        collectionObjectService?.loadRecipesBy(request: request1){ [weak self] (result) in
//
//            guard let self = self else { return }
//
//            guard let object = result.successResult else {
//                print(result.unwrapFailureResult.localizedDescription)
//                return
//            }
//
//            self.object = object
//
//           print  (object.hits[0].recipe.title)
//        }
//
//    }
//
//}

//
//// MARK: Private Methods
//
//private extension ObjectViewModel {
//
//    func loadImageForObject() {
//
//        guard let object = object else { return }
//        self.collectionObjectService.loadObjectImageWith(stringUrl: object.artObject.image.url) { (result) in
//
//            guard let image = result.successResult else {
//                print(result.unwrapFailureResult.localizedDescription)
//                return
//            }
//
//            self.objectImage = image
//        }
//
//    }
//
//}
