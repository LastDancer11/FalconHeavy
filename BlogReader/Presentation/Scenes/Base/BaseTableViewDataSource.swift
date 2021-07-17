//
//  BaseTableViewDataSource.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class BaseTableViewDataSource: NSObject {
    
    // MARK: - Variables
    var singleSectionModels: [CellItem]!
    var multiSectionModels: [[CellItem]]!
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
        }
    }
    
    func refresh() {
        
    }
    
    func initCustomTableViewCell(for indexPath: IndexPath, with cellIdentifier: String) -> UITableViewCell? {
        return nil
    }
    
}

// MARK: UITable View Data Source
extension BaseTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if singleSectionModels != nil {
            return 1
        } else if multiSectionModels != nil {
            return multiSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsForTableView(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = itemsForTableView(for: indexPath.section)[indexPath.row]
        let cell: UITableViewCell
        
        
        switch cellViewModel.cellIdentifier {
        case CategoryCell.identifier:
            cell = tableView.deque(CategoryCell.self, for: indexPath)
        case StoryCell.identifier:
            cell = tableView.deque(StoryCell.self, for: indexPath)
        case FeedCell.identifier:
            cell = tableView.deque(FeedCell.self, for: indexPath)
        case FeedCategoryCell.identifier:
            cell = tableView.deque(FeedCategoryCell.self, for: indexPath)
        case RelatedStoryCell.identifier:
            cell = tableView.deque(RelatedStoryCell.self, for: indexPath)
        default:
            if let _cell = initCustomTableViewCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? TableCellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func itemsForTableView(for section: Int) -> [CellItem] {
        if singleSectionModels != nil {
            return singleSectionModels
        } else if multiSectionModels != nil {
            return multiSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

// MARK: Setupers
protocol TableCellConfigurable: UITableViewCell {
    func configure(with item: CellItem)
}

