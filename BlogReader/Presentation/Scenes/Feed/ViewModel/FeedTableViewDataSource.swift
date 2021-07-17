//
//  FeedTableViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

final class FeedTableViewDataSource: BaseTableViewDataSource {
    
    // MARK: - Variables
    private var viewModel: FeedViewModelProtocol!
    
    init(with tableView: UITableView) {
        super.init()
        
        self.tableView = tableView
        
        multiSectionModels = []
    }
    
    // MARK: - Table View Setuper
    override func refresh() {
        multiSectionModels = [[], [], []]
        
        multiSectionModels[0].append(feedCategoryCell)
        
        multiSectionModels[1].append(feedCell)
        
        multiSectionModels[2].append(relatedStoryCell)
        
        tableView?.reloadData()
    }
    
    
}

// MARK: - Cell Registration
private extension FeedTableViewDataSource {
    
    private var feedCategoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: FeedCategoryCell.identifier)
    }
    
    private var feedCell: CellViewModel {
        return CellViewModel(cellIdentifier: FeedCell.identifier)
    }
    
    private var relatedStoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: RelatedStoryCell.identifier)
    }
    
//    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
//        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
//                             userData: [.data: data])
//    }
    
}


