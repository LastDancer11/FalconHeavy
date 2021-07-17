//
//  FeedCategoryCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class FeedCategoryCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: FeedCollectionViewDataSource!
    private var viewModel: FeedViewModelProtocol!
    private var categoryManager: CategoryManagerProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: FeedCategoryItemCell.self)
        
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        categoryManager = CategoryManager()
        viewModel = FeedViewModel(categoryManager: categoryManager)
        dataSource = FeedCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refreshCategoryItems()
    }
    
    
    
}
