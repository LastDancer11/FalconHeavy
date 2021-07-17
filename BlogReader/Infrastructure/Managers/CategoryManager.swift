//
//  CategoryManager.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

protocol CategoryManagerProtocol: AnyObject {
    func fetchCategories(completion: @escaping ((Result<[CategoryModel], Error>) -> Void))
}

class CategoryManager: CategoryManagerProtocol {
    
    func fetchCategories(completion: @escaping ((Result<[CategoryModel], Error>) -> Void)) {
        
        let url = "https://run.mocky.io/v3/3a81cb92-481d-442a-8852-a1c447277c89"
        
        NetworkManager.shared.get(url: url) { (result: Result<[CategoryModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}
