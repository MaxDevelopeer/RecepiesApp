//
//  String+Extension.swift
//  RecepiesApp
//
//  Created by Maxim on 01/03/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
        return boundingBox.height
    }
}
