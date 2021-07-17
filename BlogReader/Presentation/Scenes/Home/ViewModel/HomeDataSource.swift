//
//  HomeDataSource.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

final class HomeDataSource: BaseCollectionViewDataSource {
    
    // MARK: - Variables
    private var viewModel: HomeViewModelProtocol!
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        multiSectionModels = []
    }
    
    // MARK: - Table View Setuper
    override func refresh() {
        multiSectionModels = [[], []]
        
        for _ in 0...4 {
            multiSectionModels[0].append(categoryCell)
        }
        
        for _ in 0...3 {
            multiSectionModels[1].append(storyCell)
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
private extension HomeDataSource {
    
    private var categoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: CategoryItemCell.identifier)
    }
    
    private var storyCell: CellViewModel {
        return CellViewModel(cellIdentifier: StoryItemCell.identifier)
    }
    
//    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
//        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
//                             userData: [.data: data])
//    }
    
}

// MARk - UITableView Delegate
extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 1 {
           return CGSize(width: 342, height: 218)
        }
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
