//
//  HttpClient.swift
//  GoodBot
//
//  Created by Gary Pan on 10/4/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation
import Combine

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

struct HttpClient {
    static let shared = HttpClient()
    private init(){}
        
    func get<T: Decodable>(url: URL, decodable: T.Type) -> AnyPublisher<T, APIError> {
//        let request = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                print("got data")
                return data
            }
            .decode(type: decodable, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func post() {
        
    }
}
