//
//  CollectionViewConfigurator.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionConfigurator  {
    
    var dataProvider: DataProviderBase { get }
    
    init(collectionView: UICollectionView, dataProvider: DataProviderBase)
}


class CollectionViewConfigurator: NSObject, CollectionConfigurator {
    
    let dataProvider: DataProviderBase
    
    private let collectionView: UICollectionView
    
    required init(collectionView: UICollectionView, dataProvider: DataProviderBase) {
        self.collectionView = collectionView
        self.dataProvider = dataProvider
        super.init()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}


extension CollectionViewConfigurator: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataProvider.getAmountOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.getAmountOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dataProvider.getCellForItem(at: indexPath, for: collectionView) ?? UICollectionViewCell()
    }
    
}

extension CollectionViewConfigurator: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        dataProvider.selectedItemCompletion(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        dataProvider.willDisplayItemCompletion(cell, collectionView, indexPath)
    }
    
}

extension CollectionViewConfigurator: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataProvider.getSizeOfItem(at: indexPath, for: collectionView)
    }
    
}
