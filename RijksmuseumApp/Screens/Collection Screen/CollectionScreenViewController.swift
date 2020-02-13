//
//  CollectionScreenViewController.swift
//  RijksmuseumApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

class CollectionScreenViewController: UIViewController {
    
    
    @IBOutlet private var collectionItemsTableView: UITableView? {
        didSet {
            //collectionItemsTableView?.delegate = self
           // collectionItemsTableView?.dataSource = self
            collectionItemsTableView?.tableFooterView = UIView()
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        self.navigationItem.title = "Collection"
        
        
        let viewSearch = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0))
        let searchBar = UISearchBar(frame: viewSearch.bounds)
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal //barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        viewSearch.addSubview(searchBar)
        
        collectionItemsTableView?.tableHeaderView = viewSearch
    }
    
    
    
}


extension CollectionScreenViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
}

//extension CollectionScreenViewController: UITableViewDelegate, UITableViewDataSource {
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//
//
//
//}
