//
//  ImageService.swift
//  ImageGallery
//
//  Created by Apple on 04/03/23.
//

import SwiftUI

protocol WebService {
    func fetchImages<T: Decodable>(page: Int, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class ImageWebService: WebService {
    private let baseUrl = "https://picsum.photos/v2/list"
    private let pageSize = 10

    func fetchImages<T: Decodable>(page: Int, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: "\(baseUrl)?page=\(page)&limit=\(pageSize)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }

            do {
                let images = try JSONDecoder().decode(responseType.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(images))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
