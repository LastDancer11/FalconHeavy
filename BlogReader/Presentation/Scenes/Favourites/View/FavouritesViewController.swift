//
//  FavouritesViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class FavouritesViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: FavouritesCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(class: FavouriteCategoryItemCell.self)
        collectionView.registerNib(class: FavouriteItemCell.self)

        configureDataSource()
    }
    
    private func configureDataSource() {
        dataSource = FavouritesCollectionViewDataSource(with: collectionView)
        dataSource.refresh()
    }

}
