//
//  RelatedStoryManager.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

protocol RelatedStoryManagerProtocol: AnyObject {
    func fetchRelatedStories(completion: @escaping ((Result<[RelatedStoryModel], Error>) -> Void))
}

class RelatedStoryManager: RelatedStoryManagerProtocol {
    func fetchRelatedStories(completion: @escaping ((Result<[RelatedStoryModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/73cc019d-e77b-4c66-9e8b-6d9b44acd39b"
        NetworkManager.shared.get(url: url) { (result: Result<[RelatedStoryModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
