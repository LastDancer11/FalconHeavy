//
//  FeedNewsCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit
import Kingfisher

class FeedCell: UITableViewCell, TableCellConfigurable {
   
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var blogerImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedCategoryLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var feedPublicationTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       setupLayout()
    }
    
    private func setupLayout() {
        categoryView.layer.cornerRadius = categoryView.frame.width / 2
        blogerImage.layer.cornerRadius = blogerImage.frame.width / 2
        feedImage.layer.cornerRadius = 22
    }
    
    func configure(with item: CellItem){
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? FeedModel else { return }
        
        feedImage.kf.setImage( with: URL(string: data.image ?? ""))
        blogerImage.kf.setImage( with: URL(string: data.blogerImage ?? ""))
        authorName.text = data.bloger
        feedPublicationTimeLabel.text = data.time
        feedCategoryLabel.text = data.category
        feedTitleLabel.text = data.title
        categoryView.backgroundColor = data.color?.color()
    }
    
}
