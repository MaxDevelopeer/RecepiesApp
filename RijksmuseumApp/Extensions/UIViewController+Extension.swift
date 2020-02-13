//
//  UIViewController+Extension.swift
//  RijksmuseumApp
//
//  Created by Maxim Kruchinin on 13/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var nibName: String {
        return String(describing: Self.self)
    }
    
}


 
extension UIViewController {
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
}
