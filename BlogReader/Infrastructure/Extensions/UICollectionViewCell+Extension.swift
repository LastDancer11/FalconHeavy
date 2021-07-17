//
//  UICollectionViewCell+Extension.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}
