//
//  NewsViewModel.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

protocol NewsViewModelProtocol {
    
    func fetchNews(completion: @escaping ((Result<[NewsModel], Error>) -> Void))

    var newsManager: NewsManagerProtocol { get }
    
    init(newsManager: NewsManagerProtocol)
}

final class NewsViewModel: NewsViewModelProtocol {
    
    private(set) var newsManager: NewsManagerProtocol
    
    init(newsManager: NewsManagerProtocol) {
        self.newsManager = newsManager
    }
    
    func fetchNews(completion: @escaping ((Result<[NewsModel], Error>) -> Void)){
        newsManager.fetchNews(completion: completion)
    }
}
