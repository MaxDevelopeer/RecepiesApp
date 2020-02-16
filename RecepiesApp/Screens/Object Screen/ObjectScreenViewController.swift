//
//  ObjectScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 12/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit
//
//class ObjectScreenViewController: UIViewController {
//
//    // MARK: Private Properties
//
//    @IBOutlet private var authorLabel: UILabel?
//    @IBOutlet private var descriptionLabel: UILabel?
//
//    @IBOutlet private var objectImage: UIImageView? {
//        didSet {
//            objectImage?.layer.cornerRadius = 5.0
//        }
//    }
//
//
//    // MARK: Private Constants
//
//    private let collectionObjectViewModel: ObjectViewModel
//
//
//    // MARK: Init
//
//    init(collectionObjectViewModel: ObjectViewModel) {
//        self.collectionObjectViewModel = collectionObjectViewModel
//        super.init(nibName: ObjectScreenViewController.nibName, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    // MARK: View lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureNavigationBar()
//        collectionObjectViewModel.loadObjectWith()
//
//        collectionObjectViewModel.loadedCompletion = {
//            DispatchQueue.main.async {
////                self.navigationItem.title = self.collectionObjectViewModel.getObjectTitle
////                self.authorLabel?.text = self.collectionObjectViewModel.getObjectCreator
////                self.descriptionLabel?.text = self.collectionObjectViewModel.getObjectDescription
//             //   self.objectImage?.image = self.collectionObjectViewModel.objectImage
//            }
//        }
//    }
//
//}
//
//
