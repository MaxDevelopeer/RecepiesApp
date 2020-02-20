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
            recipeImage?.layer.cornerRadius = 5.0
        }
    }
    
    @IBOutlet var titleLabel: UILabel?
    
    
}
