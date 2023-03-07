//
//  FavouriteStoreMock.swift
//  ImageGalleryTests
//
//  Created by Apple on 07/03/23.
//

import Foundation
@testable import ImageGallery

class FavouriteStoreMock: FavouriteStoreType {
    
    var addToFavourites = false
    
    var favourites: [ImageModel] = []
    
    var handleFavouritesCallCount = 0
    func handleFavourites(using imageModel: ImageModel) {
        handleFavouritesCallCount += 1
        if addToFavourites {
            favourites.append(imageModel)
        } else {
            if favourites.count > 0 {
                //always remove at 0 for testing
                favourites.remove(at: 0)
            }
        }
    }
}
