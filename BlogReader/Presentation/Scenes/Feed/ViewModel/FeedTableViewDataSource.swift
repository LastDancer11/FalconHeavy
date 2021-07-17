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
    
    init(with tableView: UITableView, viewModel: FeedViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView?.delegate = self
        
        self.viewModel = viewModel
        
        multiSectionModels = []
    }
    
    // MARK: - Table View Setuper
    override func refresh() {
        multiSectionModels = [[], [], []]
        
        multiSectionModels[0].append(feedCategoryCell)
        
        viewModel.fetchFeed { result in
            switch result {
            case .success(let feedList):
                DispatchQueue.main.async {
                    for feed in feedList {
                        self.multiSectionModels[1].append(self.feedCell(data: feed))
                    }
                    self.tableView?.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        multiSectionModels[2].append(relatedStoryCell)
       
    }
    
    
}

// MARK: - Cell Registration
private extension FeedTableViewDataSource {
    
    private var feedCategoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: FeedCategoryCell.identifier)
    }
    
    private func feedCell(data: FeedModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: FeedCell.identifier,
                             userData: [.data: data])
    }

    private var relatedStoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: RelatedStoryCell.identifier)
    }

}

extension FeedTableViewDataSource: UITableViewDelegate {
    
}


