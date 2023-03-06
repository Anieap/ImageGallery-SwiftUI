//
//  ImageModel.swift
//  ImageGallery
//
//  Created by Apple on 04/03/23.
//

import Foundation

struct ImageModel: Identifiable, Decodable, Equatable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadUrl: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadUrl = "download_url"
    }
}
