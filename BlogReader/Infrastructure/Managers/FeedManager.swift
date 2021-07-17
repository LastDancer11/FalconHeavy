//
//  FeedManager.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

protocol FeedManagerProtocol: AnyObject {
    func fetchFeed(completion: @escaping ((Result<[FeedModel], Error>) -> Void))
}

class FeedManager: FeedManagerProtocol {
    
    func fetchFeed(completion: @escaping ((Result<[FeedModel], Error>) -> Void)) {
        
        let url = "https://run.mocky.io/v3/8e7acf6d-30fd-4467-ac33-8a19756267e4"
        
        NetworkManager.shared.get(url: url) { (result: Result<[FeedModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}
