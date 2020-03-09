//
//  RecipesListCollectionViewFooter.swift
//  RecepiesApp
//
//  Created by Maxim on 17/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipesListCollectionViewLoadingCell: UICollectionViewCell {
    
    
    func configure(with viewModel: RecipesListViewModelBase, at indexPath: IndexPath, completion: closure?) {
          
        DispatchQueue.main.async { self.loaderView?.startAnimating() }
        viewModel.loadRecipes(page: .next) {

            DispatchQueue.main.async { self.loaderView?.stopAnimating() }
            completion?()
          //  collectionView.insertItems(at: self.recipesListViewModel.getIndexPathsForNewItems())
               }
        }
    
    
    @IBOutlet private var loaderView: UIActivityIndicatorView? {
        didSet {
            loaderView?.hidesWhenStopped = true
        }
    }
    
}
