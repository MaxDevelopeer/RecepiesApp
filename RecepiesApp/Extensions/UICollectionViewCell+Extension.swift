//
//  CollectionView+Extension.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 18/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

extension UIResponder {
    
    static var stringIdentifier: String {
        return String(describing: Self.self)
    }
    
}

protocol NibLoadarable {
    
    static var nib: UINib { get }
    
    static var stringIdentifier: String { get }
     
}

extension UICollectionViewCell: NibLoadarable {
    
    
    
    static var nib: UINib {
        return UINib(nibName: stringIdentifier, bundle: nil)
    }
    
}

extension UICollectionView {
    
    func registerCell<CellType: NibLoadarable> (type: CellType.Type) {
        self.register(type.nib, forCellWithReuseIdentifier: type.stringIdentifier)
    }
    
    func getReusableCell<CellType: NibLoadarable> (type: CellType.Type, for indexPath: IndexPath) -> CellType? {
        if let cell = self.dequeueReusableCell(withReuseIdentifier: type.stringIdentifier, for: indexPath) as? CellType {
            return cell
        } else {
            return nil
        }
    }
    
}
