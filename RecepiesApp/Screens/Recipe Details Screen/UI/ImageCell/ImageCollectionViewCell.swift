//
//  ImageHeaderCollectionReusableView.swift
//  RecepiesApp
//
//  Created by Maxim on 01/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet var imageView: UIImageView? {
        didSet {
            imageView?.layer.cornerRadius = 5.0
        }
    }

    
    
}
