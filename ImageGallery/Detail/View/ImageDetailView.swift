//
//  ImageDetailView.swift
//  ImageGallery
//
//  Created by Apple on 05/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageDetailView: View {
    @Binding var imageDetail: ImageDetails?
    @StateObject var viewModel: ImageDetailViewModel = ImageDetailViewModel()
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: imageDetail?.image?.downloadUrl ?? ""))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .bottomLeading) {
                    Button {
                        viewModel.handleFavourites(with: imageDetail?.image)
                    } label: {
                        Image(systemName: viewModel.iconName)
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                    .padding()
                }
        }
        .onAppear {viewModel.initializeUI(imageModel: imageDetail?.image)}
        .onDisappear {
            imageDetail = nil
        }
    }
}


