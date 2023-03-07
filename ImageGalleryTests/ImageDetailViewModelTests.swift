//
//  ImageDetailViewModelTests.swift
//  ImageGalleryTests
//
//  Created by Apple on 07/03/23.
//

import XCTest
@testable import ImageGallery

final class ImageDetailViewModelTests: XCTestCase {
    
    var viewModel: ImageDetailViewModel!

    override func setUpWithError() throws {
        viewModel = ImageDetailViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInitializeUI_has_favourites() {
        let imageModel = ImageModel(id: "1",
                                    author: "Ann",
                                    width: 30,
                                    height: 30,
                                    url: "https://unsplash.com/photos/N7XodRrbzS0",
                                    downloadUrl: "https://picsum.photos/id/2/5000/3333")
        let favouriteStoreMock = FavouriteStoreMock()
        favouriteStoreMock.favourites = [ImageModel(id: "1",
                                                    author: "Anie",
                                                    width: 20,
                                                    height: 20,
                                                    url: "https://unsplash.com/photos/LNRyGwIJr5c",
                                                    downloadUrl: "https://picsum.photos/id/1/5000/3333"),
                                         ImageModel(id: "1",
                                                    author: "Ann",
                                                    width: 30,
                                                    height: 30,
                                                    url: "https://unsplash.com/photos/N7XodRrbzS0",
                                                    downloadUrl: "https://picsum.photos/id/2/5000/3333")]
        viewModel = ImageDetailViewModel(favouriteStore: favouriteStoreMock)
        
        viewModel.initializeUI(imageModel: imageModel)
        
        XCTAssertEqual(viewModel.iconName, "heart.fill")
    }
    
    func testInitializeUI_has_no_favourites() {
        let imageModel = ImageModel(id: "1",
                                    author: "Ann",
                                    width: 30,
                                    height: 30,
                                    url: "https://unsplash.com/photos/N7XodRrbzS0",
                                    downloadUrl: "https://picsum.photos/id/2/5000/3333")
        let favouriteStoreMock = FavouriteStoreMock()
        favouriteStoreMock.favourites = [ImageModel(id: "1",
                                                    author: "Anie",
                                                    width: 20,
                                                    height: 20,
                                                    url: "https://unsplash.com/photos/LNRyGwIJr5c",
                                                    downloadUrl: "https://picsum.photos/id/1/5000/3333")]
        viewModel = ImageDetailViewModel(favouriteStore: favouriteStoreMock)
        
        viewModel.initializeUI(imageModel: imageModel)
        
        XCTAssertEqual(viewModel.iconName, "heart")
    }
    
    func testHandleFavourites() {
        let imageModel = ImageModel(id: "1",
                                    author: "Ann",
                                    width: 30,
                                    height: 30,
                                    url: "https://unsplash.com/photos/N7XodRrbzS0",
                                    downloadUrl: "https://picsum.photos/id/2/5000/3333")
        
        let favouriteStoreMock = FavouriteStoreMock()
        viewModel = ImageDetailViewModel(favouriteStore: favouriteStoreMock)
        viewModel.handleFavourites(with: imageModel)
        
        XCTAssertEqual(favouriteStoreMock.handleFavouritesCallCount, 1)
        XCTAssertEqual(viewModel.iconName, "heart")
    }
}
