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
    private var collectionObjectViewModel: ObjectViewModel? {
        didSet {
          DispatchQueue.main.async { self.configureOutlets() }
        }
    }
    
    @IBOutlet private var authorLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    
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
        
        configureNavigationBar()
        
              do {
                  try collectionService.loadObjectWith(id: "SK-C-5", completion: { (result) in
                      switch result {
                      case .failure(let error):
                        print(error.localizedDescription)
                      case .success(let objectViewModel):
                        self.collectionObjectViewModel = objectViewModel
                        
                        let imgUrl = URL(string: objectViewModel.getObjectImageStringUrl)!
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


private extension ObjectScreenViewController {
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func configureOutlets() {
        guard let objectViewModel = collectionObjectViewModel else { return }
        navigationItem.title = objectViewModel.getObjectTitle
        authorLabel?.text = objectViewModel.getObjectCreator
        descriptionLabel?.text = objectViewModel.getObjectDescription
    }
    
    
    
}
