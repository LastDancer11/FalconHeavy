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

    var favouriteManager: FavouritesManagerProtocol { get }
    
    init(favouriteManager: FavouritesManagerProtocol)
    
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
   
    private(set) var favouriteManager: FavouritesManagerProtocol
        
    init(favouriteManager: FavouritesManagerProtocol) {
        self.favouriteManager = favouriteManager
    }
    
    func fetchFavourites(completion: @escaping ((Result<[FavouriteModel], Error>) -> Void)) {
        favouriteManager.fetchFavourites(completion: completion)
    }
    
  
}
