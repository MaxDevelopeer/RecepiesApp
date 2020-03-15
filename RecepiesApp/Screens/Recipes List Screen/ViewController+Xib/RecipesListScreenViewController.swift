//
//  CollectionScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipesListScreenViewController: UIViewController {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    @IBOutlet private var recipesListCollectionView: UICollectionView? {
        didSet {
            recipesListCollectionView?.backgroundView = activityIndicator
        }
    }
    
    private let recipesListScreenViewModel: RecipesListViewModelBase
    
    private var collectionViewConfigurator: CollectionViewConfigurator?
    
    // MARK: Init
    
    init(recipesListScreenViewModel: RecipesListViewModelBase) {
        self.recipesListScreenViewModel = recipesListScreenViewModel
        super.init(nibName: RecipesListScreenViewController.stringIdentifier, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        navigationItem.title = "Recipes List"
        
        guard let collectionView = recipesListCollectionView else {
            return
        }
        
        let dataProvider = RecipesListDataProvider(with: recipesListScreenViewModel)
        collectionViewConfigurator = CollectionViewConfigurator(collectionView: collectionView, dataProvider: dataProvider)
        
        recipesListCollectionView?.registerCell(type: RecipesListCollectionViewCell.self)
        recipesListCollectionView?.registerCell(type: RecipesListCollectionViewLoadingCell.self)
        
        activityIndicator.startAnimating()
        
        recipesListScreenViewModel.loadRecipes(page: .fromStart) {
            self.recipesListCollectionView?.reloadData()
            self.activityIndicator.stopAnimating()
        }
        
    }
    
    
}
