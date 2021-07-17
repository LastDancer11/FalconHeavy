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
    
    // MARK: - Inits
    init(with collectionView: UICollectionView, viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    // MARK: - Collection View Setuper
    func refreshCategoryItems() {
        viewModel.fetchCategories { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let categories):
                    for category in categories {
                        self.singleSectionModels.append(self.categoryItemCell(data: category))
                    }
                case .failure(let error):
                    print(error)
                }
                
                self.collectionView?.reloadData()
            }
        }
    }
    
}

// MARK: - Cell Registration
private extension HomeCollectionViewDataSource {
    
    private func categoryItemCell(data: CategoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: CategoryItemCell.identifier,
                             userData: [.data: data])
    }
    
}
