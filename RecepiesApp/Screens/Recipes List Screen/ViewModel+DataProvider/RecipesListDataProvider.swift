//
//  RecipesListDataProvider.swift
//  RecepiesApp
//
//  Created by Maxim on 07/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

protocol RecipesListDataProviderBase: DataProviderBase {
    init(with viewModel: RecipesListViewModelBase)
}


class RecipesListDataProvider: RecipesListDataProviderBase {

    private let recipesListViewModel: RecipesListViewModelBase
    
    required init(with viewModel: RecipesListViewModelBase) {
        self.recipesListViewModel = viewModel
    }
    
    var getAmountOfSections: Int {
        return 2
    }
    
    lazy var selectedItemCompletion: (IndexPath) -> () = { [recipesListViewModel] (indexPath) in
        guard indexPath.section == 0 else { return }
        guard let recipeViewModel = recipesListViewModel.getRecipeViewModel(at: indexPath) else { return }
        
//        self.navigationController?.pushViewController(RecipeDetailsScreenViewController(recipeViewModel: recipeViewModel), animated: true)
    }
    
    lazy var willDisplayItemCompletion: (UICollectionViewCell, UICollectionView, IndexPath) -> () = { [recipesListViewModel]
        (cell, collectionView, indexPath) in
        
        if let recipeCell = cell as? RecipesListCollectionViewCell {
            recipeCell.configure(with: recipesListViewModel, at: indexPath, completion: nil)
        }
        
        if let loadCell = cell as? RecipesListCollectionViewLoadingCell {
            loadCell.configure(with: recipesListViewModel, at: indexPath) {
                collectionView.insertItems(at: recipesListViewModel.getIndexPathsForNewItems())
            }
        }
        
    }
    
    
    func getAmountOfItems(in section: Int) -> Int {
        return SectionsSetuper(indexPath: IndexPath(item: 0, section: section))?.amountOfItems(in: recipesListViewModel) ?? 0
    }
    
    func getCellForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> UICollectionViewCell? {
        return SectionsSetuper(indexPath: indexPath)?.getCell(in: collectionView) ?? nil
    }
        
    func getSizeOfItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize {
        SectionsSetuper(indexPath: indexPath)?.sizeOfItem(in: collectionView) ?? CGSize()
    }
    
}


private extension RecipesListDataProvider {
    
    enum SectionsSetuper {
        
        case first(indexPath: IndexPath)
        case second(indexPath: IndexPath)
        
        
        func amountOfItems(in viewModel: RecipesListViewModelBase) -> Int {
            switch self {
            case .first:
                return viewModel.itemsCount
            case .second:
                return viewModel.itemsCount > 0 ? 1 : 0
            }
        }
        
        func sizeOfItem(in collectionView: UICollectionView) -> CGSize {
            switch self {
            case .first:
                return CGSize(width: collectionView.bounds.width * 0.5 - 5, height: 200)
            case .second:
                return CGSize(width: collectionView.bounds.width, height: 120)
            }
        }
        
        func getCell(in collectionView: UICollectionView) -> UICollectionViewCell? {
            switch self {
            case .first(let indexPath):
                return collectionView.getReusableCell(type: RecipesListCollectionViewCell.self, for: indexPath)
            case .second(let indexPath):
                return collectionView.getReusableCell(type: RecipesListCollectionViewLoadingCell.self, for: indexPath)
            }
        }
        
        init?(indexPath: IndexPath) {
            if indexPath.section == 0 { self = .first(indexPath: indexPath); return }
            if indexPath.section == 1 { self = .second(indexPath: indexPath); return }
            return nil
        }
    }
    
    
}
