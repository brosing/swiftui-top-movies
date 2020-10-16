//
//  MovieService.swift
//  MovieInfo
//
//  Created by singgih on 06/10/20.
//

import Foundation
import Combine

enum Category: String, CaseIterable {
    case movie
    case tv
}

final class MovieService {
    // private static let sortBy = URLQueryItem(name: "sort_by", value: "popularity.desc")
    private static let apiKey = URLQueryItem(name: "api_key", value: "914a18928841604bcf6b2c32308374d4")
    private static var urlComponents = URLComponents(string: "https://api.themoviedb.org")!
    
    static func discover(category: Category, params: [String: String]) -> AnyPublisher<DiscoverModel, ErrorRequestModel> {
        var queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        queryItems.append(apiKey)
        
        urlComponents.path = "/3/discover/\(category.rawValue)"
        urlComponents.queryItems = queryItems
        
        let publisher = URLSession.shared.dataTaskPublisher(for: urlComponents.url!)
            .tryMap { response in
                if let httpURLResponse = response.response as? HTTPURLResponse,
                   !(200...299 ~= httpURLResponse.statusCode) {
                    throw ErrorRequestModel.message("Got an HTTP \(httpURLResponse.statusCode) error.")
                }
                return response.data
            }
            .decode(type: DiscoverModel.self, decoder: JSONDecoder())
            .mapError({ (error) ->  ErrorRequestModel in
                debugPrint("error", error)
                return ErrorRequestModel.map(error)
            })
            .eraseToAnyPublisher()
        
        return publisher
    }
}
