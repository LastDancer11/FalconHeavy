//
//  RelatedStoryCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class RelatedStoryCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: FeedCollectionViewDataSource!
    private var viewModel: FeedViewModelProtocol!
    private var relatedStoriesManager: RelatedStoryManagerProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: RelatedStoryItemCell.self)
        
        configure()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        relatedStoriesManager = RelatedStoryManager()
        viewModel = FeedViewModel(relatedStoriesManager: relatedStoriesManager)
        dataSource = FeedCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refreshRelatedStoryItems()
    }
    
}
