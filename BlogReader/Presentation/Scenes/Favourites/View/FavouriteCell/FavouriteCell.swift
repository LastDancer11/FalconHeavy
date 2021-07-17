//
//  FavouriteCell.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: FavouritesCollectionViewDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerNib(class: FavouriteItemCell.self)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        dataSource = FavouritesCollectionViewDataSource(with: collectionView)
        
    }
    
}
