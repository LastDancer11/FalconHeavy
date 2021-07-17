//
//  NewsCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class NewsCell: UICollectionViewCell, CollectionCellConfigurable {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var blurViewForNewsImage: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsImageView.layer.cornerRadius = 10
        blurViewForNewsImage.layer.cornerRadius = 10
        categoryView.layer.cornerRadius = 10
    }
    
    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? NewsModel else { return }
        
        categoryView.backgroundColor = data.color?.color()
        newsImageView.kf.setImage( with: URL(string: data.image ?? ""))
        newsTitleLabel.text = data.title
        newsDescriptionLabel.text = data.content
        categoryNameLabel.text = data.category
    }

}
