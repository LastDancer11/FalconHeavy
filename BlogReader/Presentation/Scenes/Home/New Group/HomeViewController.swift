//
//  ViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: HomeTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(class: CategoryCell.self)
        tableView.registerNib(class: StoryCell.self)
        
        configureDataSource()
        
    }
    
    private func configureDataSource() {
        dataSource = HomeTableViewDataSource(with: tableView)
        dataSource.refresh()
    }


}

