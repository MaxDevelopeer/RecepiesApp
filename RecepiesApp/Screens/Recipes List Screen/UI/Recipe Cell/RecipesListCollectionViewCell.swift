//
//  RecipesListCell.swift
//  RecepiesApp
//
//  Created by Maxim on 15/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


class RecipesListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var recipeImage: UIImageView? {
        didSet {
            recipeImage?.alpha = 0
            recipeImage?.layer.cornerRadius = 5.0
        }
    }
    
    func animateRecipeImageAppearanceWith(time: Double) {
        self.recipeImage?.alpha = 0
        UIView.animate(withDuration: time) { self.recipeImage?.alpha = 1 }
    }
    
    @IBOutlet var titleLabel: UILabel?
    
    
}
