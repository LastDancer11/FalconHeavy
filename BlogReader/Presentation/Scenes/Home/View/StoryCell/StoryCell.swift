//
//  StoryCell.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit
import Kingfisher

class StoryCell: UITableViewCell, TableCellConfigurable {

    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var bloggerImageView: UIImageView!
    @IBOutlet weak var storyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupLayout() {
        storyImageView.layer.cornerRadius = 20
        bloggerImageView.layer.cornerRadius =  bloggerImageView.frame.width / 2
        bloggerImageView.layer.borderWidth = 2
        bloggerImageView.layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(with item: CellItem){
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? StoryModel else { return }
        storyImageView.kf.setImage( with: URL(string: data.image ?? ""))
        bloggerImageView.kf.setImage( with: URL(string: data.smallImage ?? ""))
        storyNameLabel.text = data.title
    }
    
}
