//
//  FavouritesDataSource.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

final class FavouritesCollectionViewDataSource: BaseCollectionViewDataSource {
    
    // MARK: - Variables
    private var viewModel: FavouritesViewModelProtocol!
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        singleSectionModels = []
    }
    
    // MARK: - Collection View Setuper
    
    func refreshFavouriteCategories() {
        for _ in 0...4 {
            singleSectionModels.append(favouriteCategoryCell)
        }
        
        collectionView?.reloadData()
    }
    
    func refreshFavourites() {
        for _ in 0...4 {
            singleSectionModels.append(favouriteCell)
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
private extension FavouritesCollectionViewDataSource {
    
    private var favouriteCategoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: FavouriteCategoryItemCell.identifier)
    }
    
    private var favouriteCell: CellViewModel {
        return CellViewModel(cellIdentifier: FavouriteItemCell.identifier)
    }
    
//    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
//        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
//                             userData: [.data: data])
//    }
    
}

// MARk - UITableView Delegate
extension FavouritesCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 1 {
           return CGSize(width: 268, height: 392)
        }
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
