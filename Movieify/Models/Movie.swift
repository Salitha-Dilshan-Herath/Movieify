//
//  Movie.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-21.
//

import Foundation


struct MoviesResponse: Decodable {
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    var dates: MovieDates?
    var results: [Movie]?
}

struct MovieDates: Decodable {
    
    var maximum: Date?
    var minimum: Date?
    
}

struct Movie: Decodable {
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Float?
    var posterPath: String?
    var releaseDate: Date?
    var title: String?
    var video: Bool?
    var voteAverage: Float?
    var voteCount: Int?

}

struct FavouriteMovie: Decodable {
    var adult: Bool
    var backdropPath: String
    var genreIds: String
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Float
    var posterPath: String
    var releaseDate: Date
    var title: String
    var video: Bool
    var voteAverage: Float
    var voteCount: Int

}


enum MovieType: String {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    
}
