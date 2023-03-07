//
//  ImageDetailViewModel.swift
//  ImageGallery
//
//  Created by Apple on 05/03/23.
//

import Foundation

final class ImageDetailViewModel: ObservableObject {
    @Published var iconName: String = "heart"
    
    let favouriteStore: FavouriteStoreType
    
    init(favouriteStore: FavouriteStoreType = FavouriteStore.shared) {
        self.favouriteStore = favouriteStore
    }
    
    func initializeUI(imageModel: ImageModel?) {
        guard let imageModel = imageModel else { return }
        setFavouriteIcon(imageModel: imageModel)
    }
    func handleFavourites(with imageModel: ImageModel?) {
        guard let imageModel = imageModel else { return }
        favouriteStore.handleFavourites(using: imageModel)
        setFavouriteIcon(imageModel: imageModel)
    }
    
    func setFavouriteIcon(imageModel: ImageModel) {
        iconName = favouriteStore.favourites.contains(imageModel) ? "heart.fill" : "heart"
    }
}
