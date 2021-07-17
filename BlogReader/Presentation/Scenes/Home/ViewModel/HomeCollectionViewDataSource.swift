//
//  HomeDataSource.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

final class HomeCollectionViewDataSource: BaseCollectionViewDataSource {
    
    // MARK: - Variables
    private var viewModel: HomeViewModelProtocol!
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        singleSectionModels = []
    }
    
    // MARK: - Table View Setuper
    func refreshCategoryItems() {
        
        for _ in 0...5 {
            singleSectionModels.append(categoryItemCell)
        }
        
        collectionView?.reloadData()
    }
    
    func refreshStoryCellItems() {
        for _ in 0...5 {
            singleSectionModels.append(storyItemCell)
        }
        
        collectionView?.reloadData()
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
private extension HomeCollectionViewDataSource {
    
    private var categoryItemCell: CellViewModel {
        return CellViewModel(cellIdentifier: CategoryItemCell.identifier)
    }
    
    private var storyItemCell: CellViewModel {
        return CellViewModel(cellIdentifier: StoryItemCell.identifier)
    }
    
//    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
//        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
//                             userData: [.data: data])
//    }
    
}

// MARk - UITableView Delegate
extension HomeCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
   
}
