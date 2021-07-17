//
//  ViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: HomeDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(class: CategoryItemCell.self)
        collectionView.registerNib(class: StoryItemCell.self)
        
        configureDataSource()
        
    }
    
    private func configureDataSource() {
        dataSource = HomeDataSource(with: collectionView)
        dataSource.refresh()
    }


}

