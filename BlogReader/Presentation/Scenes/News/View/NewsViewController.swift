//
//  NewsViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class NewsViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: NewsCollectionViewDataSource!
    private var viewModel: NewsViewModelProtocol!
    private var newsManager: NewsManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.registerNib(class: NewsCell.self)
        
        configureDataSource()
    }
    
    func configureDataSource() {
        newsManager = NewsManager()
        viewModel = NewsViewModel(newsManager: newsManager)
        dataSource = NewsCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    

}
