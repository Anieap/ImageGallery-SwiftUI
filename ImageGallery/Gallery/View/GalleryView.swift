//
//  GalleryView.swift
//  ImageGallery
//
//  Created by Apple on 04/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct GalleryView: View {
    @StateObject private var viewModel = GalleryViewModel(imageService: ImageWebService())
    @Binding var imageDetail: ImageDetails?
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 100), spacing: 1), count: 3), spacing: 1) {
                ForEach(viewModel.images) { image in
                    Button {
                        imageDetail = ImageDetails(image: image)
                    } label: {
                        WebImage(url: viewModel.getImageUrlString(image.downloadUrl))
                            .resizable()
                            .placeholder {
                                Image(systemName: "photo.artframe")
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .frame(height: 100)
                            }
                            .transition(.fade(duration: 0.5))
                            .aspectRatio(contentMode: .fit)
                    }

                    .onAppear {
                        viewModel.loadNextImages(image)
                    }
                }
            }
        }
    }
}
