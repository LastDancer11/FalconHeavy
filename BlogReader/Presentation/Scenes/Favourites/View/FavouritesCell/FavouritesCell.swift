//
//  FavouritesCell.swift
//  SimpleBlog
//
//  Created by Admin on 17.07.21.
//

import UIKit

class FavouritesCell: UICollectionViewCell, CollectionCellConfigurable {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var underLineImage: UIImageView!
    @IBOutlet weak var bookMarkIconImage: UIImageView!
    @IBOutlet weak var blogTitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: CellItem){
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? FavouriteModel else { return }
        
        categoryLabel.text = data.category
        blogTitleLabel.text = data.title
        contentLabel.text = data.content
        
    }
}
