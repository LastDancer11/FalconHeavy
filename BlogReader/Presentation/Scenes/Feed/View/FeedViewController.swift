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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(class: FeedCell.self)
        tableView.registerNib(class: FeedCategoryCell.self)
        tableView.registerNib(class: RelatedStoryCell.self)

        configureDataSource()
    }
    
    func configureDataSource() {
        dataSource = FeedTableViewDataSource(with: tableView)
        dataSource.refresh()
    }

}
