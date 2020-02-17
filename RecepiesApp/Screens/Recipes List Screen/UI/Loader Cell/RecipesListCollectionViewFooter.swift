//
//  RecipesListCollectionViewFooter.swift
//  RecepiesApp
//
//  Created by Maxim on 17/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipesListCollectionViewLoadingCell: UICollectionViewCell {
    
    @IBOutlet private var loaderView: UIActivityIndicatorView? {
        didSet {
            loaderView?.hidesWhenStopped = true
        }
    }
    
    func startLoading() {
        DispatchQueue.main.async { self.loaderView?.startAnimating() }
    }
    
    func stopLoading() {
        DispatchQueue.main.async { self.loaderView?.stopAnimating() }
    }
    
}
