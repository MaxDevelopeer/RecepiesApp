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

extension UICollectionReusableView: NibLoadarable {
    
    static var nib: UINib {
        return UINib(nibName: stringIdentifier, bundle: nil)
    }
    
}

extension UICollectionView {
    
    func registerCell<CellType: NibLoadarable> (type: CellType.Type) {
        self.register(type.nib, forCellWithReuseIdentifier: type.stringIdentifier)
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


typealias closure = () -> ()

protocol CellConfigurator {
 
    func configure<DataType> (with data: DataType, completion: closure?)
    
}




protocol DataProvider {
    
    var getCollectionView: UICollectionView { get }
    
    var getAmountOfSections: Int { get }
    
    var selectedItemCompletion: (IndexPath) -> () { get set }
    
    var willDisplayItemCompletion: (UICollectionViewCell, IndexPath) -> () { get set }
    
    func getAmountOfItems(in section: Int) -> Int
       
    func getCellForItem(at indexPath: IndexPath) -> UICollectionViewCell
    
    func getSizeOfItem(at indexPath: IndexPath) -> CGSize
    
}






protocol CollectionConfigurator  {
    
    var dataProvider: DataProvider { get }
    
    init(dataProvider: DataProvider)
}


class CollectionViewConfigurator: NSObject, CollectionConfigurator {
    
    let dataProvider: DataProvider
    
    required init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
}


extension CollectionViewConfigurator: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.getAmountOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dataProvider.getCellForItem(at: indexPath)
    }
    
}

extension CollectionViewConfigurator: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataProvider.selectedItemCompletion(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        dataProvider.willDisplayItemCompletion(cell, indexPath)
    }
    
}

extension CollectionViewConfigurator: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataProvider.getSizeOfItem(at: indexPath)
    }
    
}


fileprivate enum SectionsSetuper {
    
    case first
    case second
    
    static var collectionView: UICollectionView!
    static var recipesListViewModel: RecipesListScreenViewModel?
    
    var sizeOfItem: CGSize {
        switch self {
        case .first:
            return CGSize(width: SectionsSetuper.collectionView.bounds.width * 0.5 - 5, height: 200)
        case .second:
            return CGSize(width: SectionsSetuper.collectionView.bounds.width, height: 120)
        }
    }
    
    var amountOfItems: Int {
        switch self {
        case .first:
            return SectionsSetuper.recipesListViewModel?.itemsCount ?? 0
        case .second:
            let amount = SectionsSetuper.recipesListViewModel?.itemsCount ?? 0
            return amount > 0 ? 1 : 0
        }
    }
    
    init?(indexPath: IndexPath) {
        if indexPath.section == 0 { self = .first; return }
        if indexPath.section == 1 { self = .second; return }
        return nil
    }
    
    
    init?(section: Int) {
        if section == 0 { self = .first; return }
        if section == 1 { self = .second; return }
        return nil
    }
    
    
    func getCellFor(indexPath: IndexPath) -> UICollectionViewCell? {
        switch self {
        case .first:
            return SectionsSetuper.collectionView.getReusableCell(type: RecipesListCollectionViewCell.self, for: indexPath)
        case .second:
            return SectionsSetuper.collectionView.getReusableCell(type: RecipesListCollectionViewLoadingCell.self, for: indexPath)
        }
    }
    
}
