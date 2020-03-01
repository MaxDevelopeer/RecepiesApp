//
//  CollectionScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class RecipesListScreenViewController: UIViewController {
    
    
    @IBOutlet private var recipesListCollectionView: UICollectionView? {
        didSet {
            recipesListCollectionView?.delegate = self
            recipesListCollectionView?.dataSource = self
        }
    }
    
    
    private let recipesListScreenViewModel: RecipesListScreenViewModel
    
    
    // MARK: Init
    
    init(recipesListScreenViewModel: RecipesListScreenViewModel) {
        self.recipesListScreenViewModel = recipesListScreenViewModel
        super.init(nibName: RecipesListScreenViewController.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        self.navigationItem.title = "Recipes List"
        
        SectionsSetuper.collectionView = recipesListCollectionView ?? UICollectionView()
        SectionsSetuper.recipesListViewModel = recipesListScreenViewModel
        recipesListCollectionView?.registerCell(type: RecipesListCollectionViewCell.self)
        recipesListCollectionView?.registerCell(type: RecipesListCollectionViewLoadingCell.self)
        
        recipesListScreenViewModel.loadRecipes(page: .fromStart) { self.recipesListCollectionView?.reloadData() }
    }
    
}


extension RecipesListScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SectionsSetuper(section: section)?.amountOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return SectionsSetuper(indexPath: indexPath)?.getCellFor(indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer { collectionView.deselectItem(at: indexPath, animated: true) }
        guard indexPath.section == 0, let recipeViewModel = recipesListScreenViewModel.getRecipeViewModel(at: indexPath) else { return }
        self.navigationController?.pushViewController(RecipeDetailsScreenViewController(recipeViewModel: recipeViewModel), animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let recipeCell = cell as? RecipesListCollectionViewCell {
            recipeCell.animateRecipeImageAppearanceWith(time: 0.25)
            recipesListScreenViewModel.loadImageForObject(at: indexPath) { recipeCell.recipeImage?.image = $0 }
            recipeCell.titleLabel?.text = recipesListScreenViewModel.getTitleForRecipe(at: indexPath)
            return
        }
        
        if let loadingCell = cell as? RecipesListCollectionViewLoadingCell {
            loadingCell.startLoading()
            
            recipesListScreenViewModel.loadRecipes(page: .next) {
                loadingCell.stopLoading()
                self.recipesListCollectionView?.insertItems(at: self.recipesListScreenViewModel.getIndexPathsForNewItems())
            }
        }
    }
    
    
}


extension RecipesListScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SectionsSetuper(indexPath: indexPath)?.sizeOfItem ?? CGSize()
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
