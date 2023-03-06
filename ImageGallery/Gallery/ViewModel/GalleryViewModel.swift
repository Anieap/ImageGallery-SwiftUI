//
//  GalleryViewModel.swift
//  ImageGallery
//
//  Created by Apple on 04/03/23.
//

import SwiftUI
import SDWebImage

class GalleryViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    private let imageService: WebService
    private var currentPage = 1

    init(imageService: WebService) {
        self.imageService = imageService
        fetchNextPage()
    }

    func fetchNextPage() {
        imageService
            .fetchImages(page: currentPage, responseType: [ImageModel].self) { result in
            switch result {
            case .success(let images):
                DispatchQueue.main.async {
                    self.images.append(contentsOf: images)
                    self.currentPage += 1
                }
            case .failure(let error):
                print("Error fetching images: \(error)")
            }
        }
    }
    
    func getImageUrlString(_ urlString: String) -> URL? {
        return URL(string: urlString)
    }
    
    func loadNextImages(_ lastImage: ImageModel) {
        if lastImage == images.last {
            self.fetchNextPage()
        }
    }
    
    func getSelectedImage(url: String) -> UIImage? {
        return UIImage(contentsOfFile: url)
    }
}
