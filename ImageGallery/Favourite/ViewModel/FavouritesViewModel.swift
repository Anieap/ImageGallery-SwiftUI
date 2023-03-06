//
//  FavouritesViewModel.swift
//  ImageGallery
//
//  Created by Apple on 05/03/23.
//

import Foundation
import SwiftUI
import Combine

class FavouritesViewModel: ObservableObject {
    @Published var favouriteStore = FavouriteStore.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        favouriteStore.$favourites
            .sink { [weak self] images in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    func unSubscribe() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
