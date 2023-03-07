//
//  ImageGalleryTests.swift
//  ImageGalleryTests
//
//  Created by Apple on 04/03/23.
//

import XCTest
@testable import ImageGallery

final class GalleryViewModelTests: XCTestCase {

   
    var viewModel: GalleryViewModel!
    var mockWebService: MockWebService!
    
    override func setUpWithError() throws {
        mockWebService = MockWebService()
        viewModel = GalleryViewModel(imageService: mockWebService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockWebService = nil
    }

    
    func testFetchNextpageSuccess() {
        viewModel.images = []
        viewModel.fetchNextPage()
                
        XCTAssertEqual(viewModel.images.count, 1)
        XCTAssertEqual(mockWebService.fetchCallCount, 2)
    }
    
    func testFetchNextPageFailed() {
        viewModel.images = []
        mockWebService.hasFetchFailed = true
        
        viewModel.fetchNextPage()
        
        XCTAssertEqual(viewModel.images.count, 0)
        XCTAssertEqual(mockWebService.fetchCallCount, 2)
    }
    
    func testGetImageUrlString_with_EmptyUrlString() {
        let invalidUrlString = ""
        
        let url = viewModel.getImageUrlString(invalidUrlString)
        
        XCTAssertNil(url)
    }
    
    func testGetImageUrlString_With_ValidUrlString() {
        let valiUrlString = "https://unsplash.com/photos/LNRyGwIJr5c"
        
        let url = viewModel.getImageUrlString(valiUrlString)
        
        XCTAssertEqual(url?.absoluteString, valiUrlString)
    }
    
    func testLoadNextImages() {
        viewModel.images = [ImageModel(id: "1",
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
        
        let lastImage = ImageModel(id: "1",
                                    author: "Ann",
                                    width: 30,
                                    height: 30,
                                    url: "https://unsplash.com/photos/N7XodRrbzS0",
                                    downloadUrl: "https://picsum.photos/id/2/5000/3333")
        
        viewModel.loadNextImages(lastImage)
        
        XCTAssertEqual(mockWebService.fetchCallCount, 2)
    }
}
