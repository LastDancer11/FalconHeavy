//
//  FavouritesViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.21.
//

import UIKit

class FavouritesViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!

    private var dataSource: FavouritesCollectionViewDataSource!
    private var viewModel:  FavouritesViewModelProtocol!
    private var favouritesManager: FavouritesManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(class: FavouritesCell.self)
        
        configureViewModel()
        setUpCollectionView()
    }
        
    private func configureViewModel() {
        favouritesManager = FavouritesManager()
        viewModel = FavouritesViewModel(favouriteManager: favouritesManager)
        dataSource = FavouritesCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 260, height: 470)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 470)
    }
}
