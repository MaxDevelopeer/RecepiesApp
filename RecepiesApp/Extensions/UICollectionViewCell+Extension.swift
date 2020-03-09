//
//  CollectionView+Extension.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 18/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit


protocol NibLoadarable {
    
    static var nib: UINib { get }
    
    static var stringIdentifier: String { get }
     
}

extension UICollectionReusableView: NibLoadarable {
    
    static var nib: UINib {
        return UINib(nibName: stringIdentifier, bundle: nil)
    }
    
}

extension UICollectionView {
    
    func registerCell<CellType: NibLoadarable> (type: CellType.Type) {
        self.register(type.nib, forCellWithReuseIdentifier: CellType.stringIdentifier)
    }
    
    func registerReusableView<ReusableView: NibLoadarable> (type: ReusableView.Type, kind: String) {
        self.register(type.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.stringIdentifier)
    }
    
    func getReusableCell<CellType: NibLoadarable> (type: CellType.Type, for indexPath: IndexPath) -> CellType? {
        if let cell = self.dequeueReusableCell(withReuseIdentifier: type.stringIdentifier, for: indexPath) as? CellType {
            return cell
        } else {
            return nil
        }
    }
    
    func getReusableView<ReusableView: NibLoadarable> (type: ReusableView.Type, for indexPath: IndexPath, kind: String) -> ReusableView? {
           if let reusableView = self.dequeueReusableSupplementaryView(ofKind: kind,
         withReuseIdentifier: type.stringIdentifier, for: indexPath) as? ReusableView {
               return reusableView
           } else {
               return nil
           }
       }
    
}
