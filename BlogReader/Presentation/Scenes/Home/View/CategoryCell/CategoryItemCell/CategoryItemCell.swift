//
//  CategoryCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class CategoryItemCell: UICollectionViewCell, CollectionCellConfigurable {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: CellItem) {
        print("configured")
    }

}
