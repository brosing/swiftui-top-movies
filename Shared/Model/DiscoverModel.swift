//
//  DiscoverModel.swift
//  MovieInfo
//
//  Created by singgih on 07/10/20.
//

import Foundation

struct DiscoverModel: Codable {
    let page, totalResults, totalPages: Int
    let results: MoviesModel
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
