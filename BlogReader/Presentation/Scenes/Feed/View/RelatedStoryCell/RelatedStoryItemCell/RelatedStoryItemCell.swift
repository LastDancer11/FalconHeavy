//
//  RelatedStoryItemCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit
import Kingfisher

class RelatedStoryItemCell: UICollectionViewCell, CollectionCellConfigurable {

    @IBOutlet weak var relatedStoryImageView: UIImageView!
    @IBOutlet weak var relatedStoryDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        relatedStoryImageView.layer.cornerRadius = relatedStoryImageView.frame.height / 2
    }

    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? RelatedStoryModel else { return }
        
        relatedStoryImageView.kf.setImage( with: URL(string: data.image ?? ""))
        relatedStoryDescriptionLabel.text = data.title
    }

}
