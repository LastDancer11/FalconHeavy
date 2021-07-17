//
//  CategoryCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class CategoryItemCell: UICollectionViewCell, CollectionCellConfigurable {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    private static var isSelectedIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? CategoryModel else { return }
        categoryNameLabel.text = data.title
        
        if CategoryItemCell.isSelectedIndex == 0 {
            configureSelectedLabel()
        }
        
        CategoryItemCell.isSelectedIndex += 1
    }
    
    private func configureSelectedLabel() {
        categoryNameLabel.layer.backgroundColor = UIColor(named: "SelectedCategoryColor")!.cgColor
        categoryNameLabel.layer.cornerRadius = 20
        categoryNameLabel.layer.borderWidth = 2
        categoryNameLabel.layer.borderColor = UIColor.lightGray.cgColor
        categoryNameLabel.textColor = .black
    }

}
