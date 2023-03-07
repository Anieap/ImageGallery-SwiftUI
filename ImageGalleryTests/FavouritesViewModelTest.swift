//
//  FavouritesViewModelTest.swift
//  ImageGalleryTests
//
//  Created by Apple on 07/03/23.
//

import XCTest
import Combine
@testable import ImageGallery

final class FavouritesViewModelTest: XCTestCase {
    var viewModel: FavouritesViewModel!
    var cancellable: Set<AnyCancellable>!

    override func setUpWithError() throws {
        viewModel = FavouritesViewModel()
        cancellable = Set<AnyCancellable>()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellable = nil
    }

    func testUnsubscribe() throws {
        viewModel.unSubscribe()
        XCTAssertTrue(viewModel.cancellables.isEmpty)
    }

}
