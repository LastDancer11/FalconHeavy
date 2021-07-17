//
//  FeedViewModel.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

import Foundation

protocol FeedViewModelProtocol {
    
    func fetchFeed(completion: @escaping ((Result<[FeedModel], Error>) -> Void))
    
    func fetchCategories(completion: @escaping ((Result<[CategoryModel], Error>) -> Void))

    func fetchRelatedStories(completion: @escaping ((Result<[RelatedStoryModel], Error>) -> Void))
    
    var categoryManager: CategoryManagerProtocol? { get }
    var feedManager: FeedManagerProtocol? { get }
    var relatedStoriesManager: RelatedStoryManagerProtocol? { get }
    
    init(categoryManager: CategoryManagerProtocol)
    
    init(relatedStoriesManager: RelatedStoryManagerProtocol)
    
    init(feedManager: FeedManagerProtocol)
}

final class FeedViewModel: FeedViewModelProtocol {
    
    private(set) var categoryManager: CategoryManagerProtocol?
    
    private(set) var relatedStoriesManager: RelatedStoryManagerProtocol?
    
    private(set) var feedManager: FeedManagerProtocol?
    
    init(categoryManager: CategoryManagerProtocol) {
        self.categoryManager = categoryManager
    }
    
    init(relatedStoriesManager: RelatedStoryManagerProtocol) {
        self.relatedStoriesManager = relatedStoriesManager
    }
    
    init(feedManager: FeedManagerProtocol) {
        self.feedManager = feedManager
    }
    
    
    func fetchCategories(completion: @escaping ((Result<[CategoryModel], Error>) -> Void)){
        categoryManager?.fetchCategories(completion: completion)
    }
    
    func fetchFeed(completion: @escaping ((Result<[FeedModel], Error>) -> Void)){
        feedManager?.fetchFeed(completion: completion)
    }
    
    func fetchRelatedStories(completion: @escaping ((Result<[RelatedStoryModel], Error>) -> Void)) {
        relatedStoriesManager?.fetchRelatedStories(completion: completion)
    }
}
