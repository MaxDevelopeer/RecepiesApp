//
//  CollectionViewConfigurator+ReusableView.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewConfiguratorWithHeader: CollectionViewConfigurator {
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return dataProvider.getReusableView?(at: indexPath, for: collectionView, kind: kind) ?? UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return dataProvider.getSizeOfHeader?(at: section, for: collectionView) ?? CGSize()
    }
    
}
