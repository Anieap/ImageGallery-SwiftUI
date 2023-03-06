//
//  FavouritesView.swift
//  ImageGallery
//
//  Created by Apple on 04/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouritesView: View {
    @StateObject var viewModel: FavouritesViewModel = FavouritesViewModel()
    @Binding var imageDetail: ImageDetails?

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 100), spacing: 1), count: 3), spacing: 1) {
                ForEach(viewModel.favouriteStore.favourites) { image in
                    Button {
                        imageDetail = ImageDetails(image: image)
                    } label: {
                        WebImage(url: URL(string: image.downloadUrl))
                            .resizable()
                            .transition(.fade(duration: 0.5))
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
        }
        .onDisappear {
            viewModel.unSubscribe()
        }
    }
}


