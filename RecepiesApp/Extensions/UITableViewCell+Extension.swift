//
//  UITableViewCell+Extension.swift
//  RecepiesApp
//
//  Created by Maxim Kruchinin on 19/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell<CellType: NibLoadarable> (type: CellType.Type) {
        self.register(type.nib, forCellReuseIdentifier: type.stringIdentifier)
    }
    
    func getReusableCell<CellType: NibLoadarable> (type: CellType.Type, to indexPath: IndexPath) -> CellType? {
        if let cell = self.dequeueReusableCell(withIdentifier: type.stringIdentifier, for: indexPath) as? CellType {
     
            return cell
        } else {
            return nil
        }
    }
    
}


extension UITableViewCell: NibLoadarable {
    
    static var nib: UINib {
        return UINib(nibName: stringIdentifier, bundle: nil)
    }
    
}
