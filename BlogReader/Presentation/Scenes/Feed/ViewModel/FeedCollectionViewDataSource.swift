//
//  FeedCollectionViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

final class FeedCollectionViewDataSource: BaseCollectionViewDataSource {
    
    // MARK: - Variables
    private var viewModel: FeedViewModelProtocol!
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        singleSectionModels = []
    }
    
    // MARK: - Table View Setuper
    func refreshCategoryItems() {
        
        for _ in 0...5 {
            singleSectionModels.append(feedCategoryItemCell)
        }
        
        collectionView?.reloadData()
    }
    
    func refreshRelatedStoryItems() {
        for _ in 0...5 {
            singleSectionModels.append(relatedStoryItemCell)
        }
        
        collectionView?.reloadData()
    }
    
}

// MARK: - Cell Registration
private extension FeedCollectionViewDataSource {
    
    private var feedCategoryItemCell: CellViewModel {
        return CellViewModel(cellIdentifier: FeedCategoryItemCell.identifier)
    }
    
    private var relatedStoryItemCell: CellViewModel {
        return CellViewModel(cellIdentifier: RelatedStoryItemCell.identifier)
    }
    
//    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
//        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
//                             userData: [.data: data])
//    }
    
}

// MARK - UICollection View Flow Layout Delegate
extension FeedCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
   
}

