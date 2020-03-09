//
//  DataProvider.swift
//  RecepiesApp
//
//  Created by Maxim on 08/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

@objc protocol DataProviderBase {
    
    var getAmountOfSections: Int { get }
    
    var selectedItemCompletion: (IndexPath) -> () { get set }
    
    var willDisplayItemCompletion: (UICollectionViewCell, UICollectionView, IndexPath) -> () { get set }
    
    func getAmountOfItems(in section: Int) -> Int
       
    func getCellForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> UICollectionViewCell?
    
    func getSizeOfItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize
    
    @objc optional func getReusableView (at indexPath: IndexPath, for collectionView: UICollectionView, kind: String) -> UICollectionReusableView
    
    @objc optional func getSizeOfHeader (at section: Int, for collectionView: UICollectionView) -> CGSize
    
}
