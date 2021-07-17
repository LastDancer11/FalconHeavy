//
//  FeedCategoryCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class FeedCategoryItemCell: UICollectionViewCell, CollectionCellConfigurable {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? CategoryModel else { return }
        
        categoryNameLabel.text = data.title
        
        categoryNameLabel.textColor = .gray
        
    }

}
