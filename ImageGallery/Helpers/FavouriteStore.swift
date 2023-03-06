//
//  ImageDetailViewModel.swift
//  ImageGallery
//
//  Created by Apple on 05/03/23.
//

import Foundation

final class FavouriteStore: ObservableObject {
    
    static let shared = FavouriteStore()
    
    @Published var favourites: [ImageModel] = []
    
    func handleFavourites(using imageModel: ImageModel) {
        if !favourites.contains(imageModel) {
            favourites.append(imageModel)
        } else {
            if let index = favourites.firstIndex(where: { $0.id == imageModel.id}) {
                favourites.remove(at: index)
            }
        }
    }
}
