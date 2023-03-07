//
//  FavouriteStoreTests.swift
//  ImageGalleryTests
//
//  Created by Apple on 07/03/23.
//

import XCTest
@testable import ImageGallery

class FavouriteStoreTests: XCTestCase {
    
    var favouriteStore: FavouriteStore!
    
    override func setUpWithError() throws {
        favouriteStore = FavouriteStore()
    }

    override func tearDownWithError() throws {
        favouriteStore = nil
    }
    
    func testHandleFavourites_if_already_in_favourites() {
        favouriteStore.favourites = [ImageModel(id: "1",
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
        
        XCTAssertEqual(favouriteStore.favourites.count, 2)
        
        let imageModel = ImageModel(id: "1",
                                    author: "Anie",
                                    width: 20,
                                    height: 20,
                                    url: "https://unsplash.com/photos/LNRyGwIJr5c",
                                    downloadUrl: "https://picsum.photos/id/1/5000/3333")
        
        favouriteStore.handleFavourites(using: imageModel)
        
        XCTAssertEqual(favouriteStore.favourites.count, 1)
    }
    
    func testHandleFavourites_if_has_no_favourite() {
        favouriteStore.favourites = []
        
        XCTAssertEqual(favouriteStore.favourites.count, 0)

        let imageModel = ImageModel(id: "1",
                                    author: "Anie",
                                    width: 20,
                                    height: 20,
                                    url: "https://unsplash.com/photos/LNRyGwIJr5c",
                                    downloadUrl: "https://picsum.photos/id/1/5000/3333")
        
        favouriteStore.handleFavourites(using: imageModel)
        
        XCTAssertEqual(favouriteStore.favourites.count, 1)
    }
    
    func testHandleFavourites_when_new_favourite_added() {
        favouriteStore.favourites = [ImageModel(id: "1",
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
        
        XCTAssertEqual(favouriteStore.favourites.count, 2)
        
        let imageModel = ImageModel(id: "3",
                                    author: "Nibn",
                                    width: 20,
                                    height: 20,
                                    url: "https://unsplash.com/photos/LNRyGwIwerw5c",
                                    downloadUrl: "https://picsum.photos/id/1/5000/4567")
        
        favouriteStore.handleFavourites(using: imageModel)
        
        XCTAssertEqual(favouriteStore.favourites.count, 3)
    }
}
