//
//  CategoryCell.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: HomeCollectionViewDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: CategoryItemCell.self)
        
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configure() {
        dataSource = HomeCollectionViewDataSource(with: collectionView)
        dataSource.refreshCategoryItems()
    }
    
}
