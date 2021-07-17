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
    private var categoryManager: CategoryManagerProtocol!
    private var viewModel: HomeViewModelProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: CategoryItemCell.self)
        
        setupCollectionView()
        
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configure() {
        categoryManager = CategoryManager()
        viewModel = HomeViewModel(categoryManager: categoryManager)
        dataSource = HomeCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refreshCategoryItems()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 40)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 0)
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    
}
