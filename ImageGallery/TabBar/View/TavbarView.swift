//
//  TavbarView.swift
//  ImageGallery
//
//  Created by Apple on 04/03/23.
//

import SwiftUI

struct TabItem {
    let systemImageName: String
    let title: String
}

struct TabBarView: View {
    @State var imageDetail: ImageDetails?
    var body: some View {
        TabView {
            GalleryView(imageDetail: $imageDetail)
                .tabItem {
                    Label("Gallery", systemImage: "photo.circle")
                }
            FavouritesView(imageDetail: $imageDetail)
                .tabItem {
                    Label("Favourite", systemImage: "heart")
                }
        }
        .sheet(item: $imageDetail) {_ in
            ImageDetailView(imageDetail: $imageDetail)
        }
    }
}
