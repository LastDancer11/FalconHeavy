//
//  NewsCollectionViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//


import UIKit

final class NewsCollectionViewDataSource: BaseCollectionViewDataSource {
    
    // MARK: - Variables
    private var viewModel: NewsViewModelProtocol!
    
    init(with collectionView: UICollectionView, viewModel: NewsViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    // MARK: - Collection View Setuper
    
    override func refresh() {
        viewModel.fetchNews { [unowned self] result in
            switch result {
            case .success(let newsList):
                DispatchQueue.main.async {
                    for news in newsList {
                        self.singleSectionModels.append(self.newsCell(data: news))
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
private extension NewsCollectionViewDataSource {
    
    private func newsCell(data: NewsModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: NewsCell.identifier,
                             userData: [.data: data])
    }
    
}

// MARK: - UICollectionView Delegate
extension NewsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: UIScreen.main.bounds.size.width - 20 - 20, height: 196)
        }
        
        return CGSize(width: UIScreen.main.bounds.size.width / 2 - 30, height: 184)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}

