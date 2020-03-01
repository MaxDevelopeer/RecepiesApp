//
//  RecipeDetailsScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim on 16/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipeDetailsScreenViewController: UIViewController {

    @IBOutlet private var recipeDetailCollectionView: UICollectionView? {
        didSet {
            recipeDetailCollectionView?.delegate = self
            recipeDetailCollectionView?.dataSource = self
            recipeDetailCollectionView?.registerCell(
                type: IngredientsCollectionViewCell.self)
            recipeDetailCollectionView?.registerCell(
                type: ImageCollectionViewCell.self)
            recipeDetailCollectionView?.registerReusableView(
                type: TitleHeaderCollectionReusableView.self,
                kind: UICollectionView.elementKindSectionHeader)
        }
    }
    
    private let recipeViewModel: RecipeViewModel
    
    
    init(recipeViewModel: RecipeViewModel) {
        self.recipeViewModel = recipeViewModel
        super.init(nibName: RecipeDetailsScreenViewController.nibName, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        SectionsSetuperDetail.collectionView = recipeDetailCollectionView ?? UICollectionView()
        SectionsSetuperDetail.recipesListViewModel = recipeViewModel
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = recipeViewModel.getRecipeTitle
       
    }
    
}


extension RecipeDetailsScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SectionsSetuperDetail(section: section)?.amountOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return SectionsSetuperDetail(indexPath: indexPath)?.getCellFor(indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let recipeCell = cell as? IngredientsCollectionViewCell {
            recipeCell.recipesIngredientLabel?.text = recipeViewModel.getRecipeIngredient(on: indexPath)
        }
        
        if let imageHeader = cell as? ImageCollectionViewCell {
            imageHeader.imageView?.image = recipeViewModel.getRecipeImage
        }
        
    }
    
    
}


extension RecipeDetailsScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SectionsSetuperDetail(indexPath: indexPath)?.getSizeOfItem(for: indexPath) ?? CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let titleHeader = SectionsSetuperDetail(indexPath: indexPath)?.getHeaderFor(indexPath: indexPath, kind: kind) as? TitleHeaderCollectionReusableView {
            titleHeader.sectionTitleLabel?.text = "Ingredients"
            return titleHeader
        }
        
        return UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return SectionsSetuperDetail(section: section)?.sizeOfHeader ?? CGSize()
    }
    
}



enum SectionsSetuperDetail {
    
    case first
    case second
    
    
    static var collectionView: UICollectionView!
    static var recipesListViewModel: RecipeViewModel?
    
    func getSizeOfItem(for indexPath: IndexPath) -> CGSize {
        switch self {
        case .first:
            return CGSize(width: SectionsSetuperDetail.collectionView.bounds.width, height: 250)
        case .second:
            guard let height = SectionsSetuperDetail.recipesListViewModel?.getHeightOfIngredientLabel(for: indexPath, width: SectionsSetuperDetail.collectionView.bounds.width) else {
                return CGSize(width: SectionsSetuperDetail.collectionView.bounds.width, height: 40)
            }
            return  CGSize(width: SectionsSetuperDetail.collectionView.bounds.width, height: height + 25.0)
        }
    }
    
    
    var sizeOfHeader: CGSize {
        switch self {
        case .first:
            return CGSize()
        case .second:
            return CGSize(width: SectionsSetuperDetail.collectionView.bounds.width, height: 100)
        }
    }
    
    var amountOfItems: Int {
        switch self {
        case .first:
            return 1
        case .second:
            return SectionsSetuperDetail.recipesListViewModel?.getRecipeIngredientCount ?? 0
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
            return SectionsSetuperDetail.collectionView.getReusableCell(type: ImageCollectionViewCell.self, for: indexPath)
        case .second:
            return SectionsSetuperDetail.collectionView.getReusableCell(type: IngredientsCollectionViewCell.self, for: indexPath)
        }
    }
    
    func getHeaderFor(indexPath: IndexPath, kind: String) -> UICollectionReusableView? {
        switch self {
        case .first:
            return nil
        case .second:
            return SectionsSetuperDetail.collectionView.getReusableView(type: TitleHeaderCollectionReusableView.self, for: indexPath, kind: kind)
            
        }
        
        
    }
    
}
