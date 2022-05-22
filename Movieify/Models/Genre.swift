//
//  Genre.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-22.
//

import Foundation

struct GenreResponse: Decodable {

    var genres: [Genre]?
}

struct Genre: Decodable {

    var id: Int
    var name: String
}
