//
//  StoryManager.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

protocol StoryManagerProtocol: AnyObject {
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void))
}

class StoryManager: StoryManagerProtocol {
    
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void)) {
        
        let url = "https://run.mocky.io/v3/a8ee55d5-ebc0-4779-ac9f-b4c06bd3439a"
        
        NetworkManager.shared.get(url: url) { (result: Result<[StoryModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}
