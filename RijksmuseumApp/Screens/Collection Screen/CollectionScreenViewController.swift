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
            collectionItemsTableView?.delegate = self
            collectionItemsTableView?.dataSource = self
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}

extension CollectionScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
    
}
