//
//  StoryCell.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class StoryItemCell: UICollectionViewCell, CollectionCellConfigurable {
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyCreatorImageView: UIImageView!
    @IBOutlet weak var storyTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: CellItem) {
        print("Story Cell Configured")
    }

}
