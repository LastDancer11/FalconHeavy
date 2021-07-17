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
    
    init(with collectionView: UICollectionView, viewModel: FeedViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    // MARK: - Table View Setuper
    func refreshCategoryItems() {
        
        viewModel.fetchCategories { [unowned self] result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    for category in categories {
                        self.singleSectionModels.append(self.feedCategoryItemCell(data: category))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    
    }
    
    func refreshRelatedStoryItems() {
        
        viewModel.fetchRelatedStories { [unowned self] result in
            switch result {
            case .success(let relatedStories):
                DispatchQueue.main.async {
                    for relatedStory in relatedStories {
                        self.singleSectionModels.append(self.relatedStoryItemCell(data: relatedStory))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
        
    }
    
}

// MARK: - Cell Registration
private extension FeedCollectionViewDataSource {
    
    private func feedCategoryItemCell(data: CategoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: FeedCategoryItemCell.identifier,
                                userData: [.data: data])
    }
    
    private func relatedStoryItemCell(data: RelatedStoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: RelatedStoryItemCell.identifier,
                             userData: [.data: data])
    }
    
}

// MARK - UICollection View Flow Layout Delegate
extension FeedCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

