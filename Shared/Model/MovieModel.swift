//
//  MovieModel.swift
//  MovieInfo
//
//  Created by singgih on 06/10/20.
//

import Foundation

struct MovieModel: Codable, Identifiable {
    let originalName: String?
    let popularity: Double
    let originCountry: [String]?
    let voteCount: Int
    let video: Bool?
    let posterPath: String
    let id: Int
    let adult: Bool?
    let firstAirDate: String?
    let backdropPath, originalLanguage: String
    let originalTitle: String?
    let genreIDS: [Int]
    let name: String?
    let title: String?
    let voteAverage: Double
    let overview: String
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case popularity
        case originCountry = "origin_country"
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case name, title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

typealias MoviesModel = [MovieModel]

let exampleMovie = MovieModel(
    originalName: nil,
    popularity: 1730.974,
    originCountry: nil,
    voteCount: 1637,
    video: false,
    posterPath: "/riYInlsq2kf1AWoGm80JQW5dLKp.jpg",
    id: 497582,
    adult: false,
    firstAirDate: nil,
    backdropPath: "/kMe4TKMDNXTKptQPAdOF0oZHq3V.jpg",
    originalLanguage: "en",
    originalTitle: "Enola Holmes",
    genreIDS: [ 80, 18, 9648 ],
    name: nil,
    title: "Enola Holmes",
    voteAverage: 7.7,
    overview: "While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord.",
    releaseDate: "2020-09-23"
)
