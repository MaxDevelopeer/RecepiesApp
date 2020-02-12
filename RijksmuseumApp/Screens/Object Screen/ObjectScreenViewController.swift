//
//  ObjectScreenViewController.swift
//  RijksmuseumApp
//
//  Created by Maxim Kruchinin on 12/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class ObjectScreenViewController: UIViewController {

    private let collectionService: CollectionObjectServiceProtocol
    
    @IBOutlet private var objectTitle: UILabel?
    @IBOutlet private var objectImage: UIImageView? {
        didSet {
            objectImage?.layer.cornerRadius = 5.0
        }
    }
    
    init(collectionService: CollectionObjectServiceProtocol) {
        self.collectionService = collectionService
        super.init(nibName: ObjectScreenViewController.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
              do {
                  try collectionService.loadObjectWith(id: "SK-C-5", completion: { (result) in
                      switch result {
                      case .failure(let error):
                          print(error.localizedDescription)
                      case .success(let object):
                        DispatchQueue.main.async { self.objectTitle?.text = object.artObject.title }
                           let imgUrl = URL(string: object.artObject.image.url)!
                           URLSession.shared.dataTask(with: imgUrl) { (data, response, error) in
                            DispatchQueue.main.async { self.objectImage?.image = UIImage(data: data!) }
                           }.resume()
                           
                      }
                  })
              } catch (let error) {
                  print(error.localizedDescription)
              }
    }

}
