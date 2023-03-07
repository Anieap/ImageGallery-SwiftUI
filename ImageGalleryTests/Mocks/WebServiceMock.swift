//
//  WebServiceMock.swift
//  ImageGalleryTests
//
//  Created by Apple on 06/03/23.
//
import Foundation
@testable import ImageGallery

class MockWebService: WebService {
    
    var hasFetchFailed = false
    var fetchCallCount = 0
    func fetchImages<T: Decodable>(page: Int, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        fetchCallCount += 1
        print("fetchCallCount")
        
        if hasFetchFailed {
            completion(.failure(WebServiceError.apiError))
        } else {
            completion(.success([ImageModel(id: "1", author: "Anie", width: 20, height: 20, url: "url", downloadUrl: "download")] as! T))
        }
        
    }
}

enum WebServiceError: LocalizedError {
    
    case parsingError
    case apiError
    case networkError
    
    var errorDescription: String? {
        switch self {
        case .apiError:
            return "Something went wrong"
        case .networkError:
            return "Check your network connection"
        case .parsingError:
            return "Error while parsing"
        }
    }
}
