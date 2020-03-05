//
//  ChooseRecipeScreenViewController.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 02/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class ChooseRecipeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet var recipeSearchInfoTableView: UITableView? {
        didSet {
            recipeSearchInfoTableView?.dataSource = self
            recipeSearchInfoTableView?.delegate = self
            recipeSearchInfoTableView?.registerCell(
            type: VerticalCollectionViewCell.self)
        }
    }
    
    init() {
        super.init(nibName: ChooseRecipeScreenViewController.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


extension ChooseRecipeScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()//tableView.getReusableCell(type: VerticalCollectionViewCell, to: indexPath)
    }
    
}
