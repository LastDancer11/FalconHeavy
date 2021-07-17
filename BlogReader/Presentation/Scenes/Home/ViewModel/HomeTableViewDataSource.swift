//
//  HomeTableViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import UIKit

final class HomeTableViewDataSource: BaseTableViewDataSource {
    
    // MARK: - Variables
    private var viewModel: HomeViewModelProtocol!
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView?.delegate = self
        
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    // MARK: - Table View Setuper
    override func refresh() {
        
        singleSectionModels.append(categoryCell)
                
        refreshStories()
        
        tableView?.reloadData()
    }
    
    func refreshStories() {
        viewModel.fetchStories { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let stories):
                    for story in stories {
                        self.singleSectionModels.append(self.storyCell(data: story))
                    }
                case .failure(let error):
                    print(error)
                }
                
                self.tableView?.reloadData()
            }
        }
    }
    
}

// MARK: - Cell Registration
private extension HomeTableViewDataSource {
    
    private var categoryCell: CellViewModel {
        return CellViewModel(cellIdentifier: CategoryCell.identifier)
    }
    
    private func storyCell(data: StoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: StoryCell.identifier,
                             userData: [.data: data])
    }
    
}

extension HomeTableViewDataSource: UITableViewDelegate {
    
}
