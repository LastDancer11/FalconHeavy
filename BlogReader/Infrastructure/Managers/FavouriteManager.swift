//
//  FavouriteManager.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

protocol FavouriteManagerProtocol: AnyObject {
    func fetchFavourites(completion: @escaping ((Result<[FavouriteModel], Error>) -> Void))
}

class FavouriteManager: FavouriteManagerProtocol {
    func fetchFavourites(completion: @escaping ((Result<[FavouriteModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/afab74be-5862-40ad-95f7-d7e160aa5eed"
        NetworkManager.shared.get(url: url) { (result: Result<[FavouriteModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
