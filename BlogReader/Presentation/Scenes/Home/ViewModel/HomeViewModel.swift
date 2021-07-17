//
//  HomeViewModel.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func fetchCategories(completion: @escaping ((Result<[CategoryModel], Error>) -> Void))
    
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void))

    var categoryManager: CategoryManagerProtocol? { get }
    var storyManager: StoryManagerProtocol? { get }
    
    init(categoryManager: CategoryManagerProtocol)
    
    init(storyManager: StoryManagerProtocol)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private(set) var categoryManager: CategoryManagerProtocol?
    
    private(set) var storyManager: StoryManagerProtocol?
    
    init(categoryManager: CategoryManagerProtocol) {
        self.categoryManager = categoryManager
    }
    
    init(storyManager: StoryManagerProtocol) {
        self.storyManager = storyManager
    }
    
    
    func fetchCategories(completion: @escaping ((Result<[CategoryModel], Error>) -> Void)){
        categoryManager?.fetchCategories(completion: completion)
    }
    
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void)){
        storyManager?.fetchStories(completion: completion)
    }
}


