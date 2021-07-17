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
    
    init(with collectionView: UICollectionView, viewModel: FavouritesViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView

        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    // MARK: - Collection View Setuper
    
    
    override func refresh(){
        
        viewModel.fetchFavourites { [unowned self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let favourites):
                    for favourite in favourites {
                        self.singleSectionModels.append(self.favouritesCell(data: favourite))
                    }
                    self.collectionView?.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }

}

// MARK: - CollectionView Cells
private extension FavouritesCollectionViewDataSource {
    private func favouritesCell(data: FavouriteModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: FavouritesCell.identifier,
                             userData: [.data: data])
    }
}
