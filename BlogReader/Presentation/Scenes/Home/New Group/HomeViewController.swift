//
//  ViewController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: HomeViewModelProtocol!
    private var dataSource: HomeTableViewDataSource!
    private var storyManager: StoryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        configureDataSource()
        
    }
    
    private func setupTableView() {
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.registerNib(class: CategoryCell.self)
        tableView.registerNib(class: StoryCell.self)
    }
    
    private func configureDataSource() {
        storyManager = StoryManager()
        viewModel = HomeViewModel(storyManager: storyManager)
        dataSource = HomeTableViewDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }
    
   


}

