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
        if section == 0 { return recipesListScreenViewModel.itemsCount }
        if section == 1 { return recipesListScreenViewModel.itemsCount > 0 ? 1 : 0 }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0 {
            
            guard let cell = collectionView.getReusableCell(type: RecipesListCollectionViewCell.self, for: indexPath) else { return UICollectionViewCell() }
            
            recipesListScreenViewModel.loadImageForObject(at: indexPath) { cell.recipeImage?.image = $0 }
            
            cell.titleLabel?.text = recipesListScreenViewModel.getTitleForRecipe(at: indexPath)
            return cell
            
        }
        else {
            return collectionView.getReusableCell(type: RecipesListCollectionViewLoadingCell.self, for: indexPath) ?? UICollectionViewCell()
            
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer { collectionView.deselectItem(at: indexPath, animated: true) }
        guard indexPath.section == 0 else { return }
        guard let recipeViewModel = recipesListScreenViewModel.getRecipeViewModel(at: indexPath) else { return }
        let vc = RecipeDetailsScreenViewController(recipeViewModel: recipeViewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let loadingCell = cell as? RecipesListCollectionViewLoadingCell else {
            return
        }
        
        loadingCell.startLoading()
        
        recipesListScreenViewModel.loadRecipes(page: .next) {
            loadingCell.stopLoading()
            self.recipesListCollectionView?.insertItems(at: self.recipesListScreenViewModel.getIndexPathsForNewItems())
        }
    }
    
    
}


extension RecipesListScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 { return CGSize(width: collectionView.bounds.width * 0.5 - 5, height: 200) }
        if indexPath.section == 1 { return CGSize(width: collectionView.bounds.width, height: 120) }
        return CGSize()
    }
    
}
