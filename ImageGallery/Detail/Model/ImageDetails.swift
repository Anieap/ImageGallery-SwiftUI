//
//  FavouritesModel.swift
//  ImageGallery
//
//  Created by Apple on 05/03/23.
//

import Foundation
import SwiftUI

struct ImageDetails: Identifiable {
    var id: String = UUID().uuidString
    var image: ImageModel?
}

