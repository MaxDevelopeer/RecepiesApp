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
        
        recipesListCollectionView?.register(UINib(nibName: String(describing: RecipesListCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: RecipesListCollectionViewCell.self))
        
        
        recipesListScreenViewModel.loadRecipes {
            DispatchQueue.main.async {
                self.recipesListCollectionView?.reloadData()
            }
        }
        
    }
    
    
    
}


extension RecipesListScreenViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
}

extension RecipesListScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipesListScreenViewModel.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RecipesListCollectionViewCell.self), for: indexPath)
        as? RecipesListCollectionViewCell else { return UICollectionViewCell() }
        
        recipesListScreenViewModel.loadImageForObject(at: indexPath, completion: { (image) in
            DispatchQueue.main.async {
                cell.recipeImage?.image = image
            }
        })
        
        cell.titleLabel?.text = recipesListScreenViewModel.getTitleForRecipe(at: indexPath)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let recipeViewModel = recipesListScreenViewModel.getRecipeViewModel(at: indexPath) {
            let vc = RecipeDetailsScreenViewController(recipeViewModel: recipeViewModel)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}



extension RecipesListScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.5 - 5, height: 200)
    }
    
}
