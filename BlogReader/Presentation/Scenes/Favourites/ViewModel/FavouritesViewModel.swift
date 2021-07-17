//
//  FavouritesViewModel.swift
//  BlogReader
//
//  Created by Admin on 17.07.2021.
//

import Foundation

import Foundation

protocol FavouritesViewModelProtocol {
    
    func fetchFavourites(completion: @escaping ((Result<[FavouriteModel], Error>) -> Void))

    var favouriteManager: FavouriteManagerProtocol { get }
    
    init(favouriteManager: FavouriteManagerProtocol)
    
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
   
    private(set) var favouriteManager: FavouriteManagerProtocol
        
    init(favouriteManager: FavouriteManagerProtocol) {
        self.favouriteManager = favouriteManager
    }
    
    func fetchFavourites(completion: @escaping ((Result<[FavouriteModel], Error>) -> Void)) {
        favouriteManager.fetchFavourites(completion: completion)
    }
    
  
}
