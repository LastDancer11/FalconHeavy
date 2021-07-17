//
//  FeedViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class FeedViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: FeedTableViewDataSource!
    private var viewModel: FeedViewModelProtocol!
    private var feedManager: FeedManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        tableView.registerNib(class: FeedCell.self)
        tableView.registerNib(class: FeedCategoryCell.self)
        tableView.registerNib(class: RelatedStoryCell.self)

        configureDataSource()
    }
    
    func configureDataSource() {
        feedManager = FeedManager()
        viewModel = FeedViewModel(feedManager: feedManager)
        dataSource = FeedTableViewDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }

}
