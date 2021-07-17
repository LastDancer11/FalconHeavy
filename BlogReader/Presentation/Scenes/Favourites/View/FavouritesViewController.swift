//
//  FavouritesViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class FavouritesViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: FavouritesDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(class: FavouriteCategoryItemCell.self)
        collectionView.registerNib(class: FavouriteCell.self)

        configureDataSource()
    }
    
    private func configureDataSource() {
        dataSource = FavouritesDataSource(with: collectionView)
        dataSource.refresh()
    }

}
