//
//  ChooseRecipeDataProvider.swift
//  RecepiesApp
//
//  Created by Maxim on 09/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//
//
//import Foundation
//import UIKit
//
//protocol ChooseRecipeDataProviderBase: DataProviderBase {
//    init(with viewModel: ChooseRecipeViewModelBase)
//}
//
//
//class ChooseRecipeDataProvider: ChooseRecipeDataProviderBase {
//
//    private let chooseRecipeViewModel: ChooseRecipeViewModelBase
//
//    required init(with viewModel: ChooseRecipeViewModelBase) {
//        self.chooseRecipeViewModel = viewModel
//    }
//
//    var getAmountOfSections: Int {
//        return 1
//    }
//
//    var selectedItemCompletion: (IndexPath) -> ()
//
//    var willDisplayItemCompletion: (UICollectionViewCell, UICollectionView, IndexPath) -> ()
//
//    func getAmountOfItems(in section: Int) -> Int {
//        chooseRecipeViewModel.getAmountOfItems(type: <#T##CollectionType#>)
//    }
//
//    func getCellForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> UICollectionViewCell? {
//        <#code#>
//    }
//
//    func getSizeOfItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize {
//        <#code#>
//    }
//
//
//
//
//}
//
//
//private extension ChooseRecipeDataProvider {
//
//    enum collectionsSetuper {
//
//        case dietCollection
//        case healthCollection
//        case mealCollection
//        case dishCollection
//
//        func getSizeOfItem(for viewModel: RecipeViewModelBase, in collectionView: UICollectionView) -> CGSize {
//            switch self {
//            case .dietCollection:
//                return CGSize(width: collectionView.bounds.width, height: 275)
//            case .second(let indexPath):
//                let height = viewModel.getHeightOfIngredientLabel(for: indexPath, width: collectionView.bounds.width)
//                return CGSize(width: collectionView.bounds.width, height: height + 25.0)
//            }
//        }
//
//
//
//    }
//
//    
//}
//
//
//
//class RecipeDataProvider: RecipeDataProviderBasic {
//
//    private let recipeViewModel: RecipeViewModelBase
//
//    required init(with viewModel: RecipeViewModelBase) {
//        self.recipeViewModel = viewModel
//    }
//
//    var getAmountOfSections: Int {
//        return 2
//    }
//
//    var selectedItemCompletion: (IndexPath) -> () = { _ in }
//
//
//    lazy var willDisplayItemCompletion: (UICollectionViewCell, UICollectionView, IndexPath) -> () = {
//        [recipeViewModel] (cell, collectionView, indexPath) in
//
//
//        if let recipeCell = cell as? IngredientsCollectionViewCell {
//            recipeCell.recipesIngredientLabel?.text = recipeViewModel.getRecipeIngredient(on: indexPath)
//        }
//
//        if let imageHeader = cell as? ImageCollectionViewCell {
//            imageHeader.imageView?.image = recipeViewModel.getRecipeImage
//        }
//
//    }
//
//    func getAmountOfItems(in section: Int) -> Int {
//        return SectionSetuper(indexPath: IndexPath(item: 0, section: section))?.amountOfItems(in: recipeViewModel) ?? 0
//    }
//
//    func getCellForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> UICollectionViewCell? {
//        return SectionSetuper(indexPath: indexPath)?.getCell(in: collectionView)
//    }
//
//    func getSizeOfItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize {
//        return SectionSetuper(indexPath: indexPath)?.getSizeOfItem(for: recipeViewModel, in: collectionView) ?? CGSize()
//    }
//
//    func getSizeOfHeader(at section: Int, for collectionView: UICollectionView) -> CGSize {
//        return SectionSetuper(indexPath: IndexPath(item: 0, section: section))?.getSizeOfHeader(for: collectionView) ?? CGSize()
//    }
//
//    func getReusableView(at indexPath: IndexPath, for collectionView: UICollectionView, kind: String) -> UICollectionReusableView {
//        SectionSetuper(indexPath: indexPath)?.getHeader(for: collectionView, kind: kind) ?? UICollectionReusableView()
//    }
//
//}
//
//
//private extension RecipeDataProvider {
//
//    enum SectionSetuper {
//
//        case first(indexPath: IndexPath)
//        case second(indexPath: IndexPath)
//
//
//        func getSizeOfItem(for viewModel: RecipeViewModelBase, in collectionView: UICollectionView) -> CGSize {
//            switch self {
//            case .first:
//                return CGSize(width: collectionView.bounds.width, height: 275)
//            case .second(let indexPath):
//                let height = viewModel.getHeightOfIngredientLabel(for: indexPath, width: collectionView.bounds.width)
//                return CGSize(width: collectionView.bounds.width, height: height + 25.0)
//            }
//        }
//
//
//        func getSizeOfHeader(for collectionView: UICollectionView) -> CGSize {
//            switch self {
//            case .first:
//                return CGSize()
//            case .second:
//                return CGSize(width: collectionView.bounds.width, height: 100)
//            }
//        }
//
//        func amountOfItems(in viewModel: RecipeViewModelBase) -> Int {
//            switch self {
//            case .first:
//                return 1
//            case .second:
//                return viewModel.getRecipeIngredientCount
//            }
//
//        }
//
//        func getCell(in collectionView: UICollectionView) -> UICollectionViewCell? {
//            switch self {
//            case .first(let indexPath):
//                return collectionView.getReusableCell(type: ImageCollectionViewCell.self, for: indexPath)
//            case .second(let indexPath):
//                return collectionView.getReusableCell(type: IngredientsCollectionViewCell.self, for: indexPath)
//            }
//        }
//
//        func getHeader(for collectionView: UICollectionView, kind: String) -> UICollectionReusableView? {
//            switch self {
//            case .first:
//                return nil
//            case .second(let indexPath):
//                return collectionView.getReusableView(type: TitleHeaderCollectionReusableView.self, for: indexPath, kind: kind)
//
//            }
//        }
//
//        init?(indexPath: IndexPath) {
//            if indexPath.section == 0 { self = .first(indexPath: indexPath); return }
//            if indexPath.section == 1 { self = .second(indexPath: indexPath); return }
//            return nil
//        }
//
//    }
//
//
//}
//
