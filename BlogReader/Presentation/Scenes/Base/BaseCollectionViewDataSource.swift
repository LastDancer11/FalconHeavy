//
//  BaseCollectionViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class BaseCollectionViewDataSource: NSObject {
    
    // MARK: - Variables
    var singleSectionModels: [CellItem]!
    var multiSectionModels: [[CellItem]]!
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.dataSource = self
        }
    }
    
    func refresh() {
        
    }
    
    func initCustomCollectionViewCell(for indexPath: IndexPath, with cellIdentifier: String) -> UICollectionViewCell? {
        return nil
    }
}

// MARK: UICollectionView Data Source
extension BaseCollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if singleSectionModels != nil {
            return 1
        } else if multiSectionModels != nil {
            return multiSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsForCollection(for: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = itemsForCollection(for: indexPath.section)[indexPath.row]
        let cell: UICollectionViewCell
        
        switch cellViewModel.cellIdentifier {
        case CategoryItemCell.identifier:
            cell = collectionView.deque(CategoryItemCell.self, for: indexPath)
        case StoryItemCell.identifier:
            cell = collectionView.deque(StoryItemCell.self, for: indexPath)
        case FavouriteCategoryItemCell.identifier:
            cell = collectionView.deque(FavouriteCategoryItemCell.self, for: indexPath)
        case FavouriteCell.identifier:
            cell = collectionView.deque(FavouriteCell.self, for: indexPath)
        default:
            if let _cell = initCustomCollectionViewCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? CollectionCellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func itemsForCollection(for section: Int) -> [CellItem] {
        if singleSectionModels != nil {
            return singleSectionModels
        } else if multiSectionModels != nil {
            return multiSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

// MARK: Setupers

protocol CollectionCellConfigurable: UICollectionViewCell {
    func configure(with item: CellItem)
}
