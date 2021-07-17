//
//  HomeTableViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

final class HomeTableViewDataSource: BaseTableViewDataSource {
    
    // MARK: - Variables
    private var viewModel: HomeViewModelProtocol!
    
    init(with tableView: UITableView) {
        super.init()
        
        self.tableView = tableView
        
        multiSectionModels = []
    }
    
    // MARK: - Table View Setuper
    override func refresh() {
        multiSectionModels = [[], []]
        
        
        multiSectionModels[0].append(categoryCell)
        
        multiSectionModels[1].append(storyCell)
        
      
        
        tableView?.reloadData()
    }
    
    // MARK: - Collection View Setupers
    
//    func setupCategoryItems() {
//
//        HomeDataSource.viewModel.fetchCategories { [unowned self] fetchedCategories in
//            let categories = fetchedCategories
//            DispatchQueue.main.async {
//                for category in categories {
//                    self.singleCollectionSectionModels.append(self.categoryItemCell(data: category))
//                }
//
//                self.collectionView?.reloadData()
//            }
//
//        }
//
//    }
    
//    func setupRecentlyViewedItems() {
//
//        HomeDataSource.viewModel.fetchRecentlyViewed { [unowned self] fetchedData in
//            let recentlyViewed = fetchedData
//
//            DispatchQueue.main.async {
//                for recently in recentlyViewed {
//                    self.singleCollectionSectionModels.append(self.recentlyViewedItemCell(data: recently))
//                }
//
//                self.collectionView?.reloadData()
//            }
//
//        }
//    }
    
}

// MARK: - Cell Registration
private extension HomeTableViewDataSource {
    
    private var categoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: CategoryCell.identifier)
    }
    
    private var storyCell: CellViewModel {
        return CellViewModel(cellIdentifier: StoryCell.identifier)
    }
    
//    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
//        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
//                             userData: [.data: data])
//    }
    
}
