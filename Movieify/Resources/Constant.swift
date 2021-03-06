//
//  Constant.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-20.
//

import Foundation

struct Constant {
    
    //MARK: -  Server URL
    public static var API_BASE_URL =  "https://api.themoviedb.org/3/"
    public static var RESOURCE_BASE_URL = "https://image.tmdb.org/t/p/original"
    
    //MARK: - Keys
    public static var MOVIE_API_KEY = "0e7274f05c36db12cbe71d9ab0393d47"
    
    //MARK: - Table Cell Identifier
    public static var MOVIE_TABLE_CELL = "MovieTVC"
    
    //MARK: - Navigation Titiles
    public static var NOW_PLAYING_TITLE = "Now Playing"
    
    //MARK: - Genre List
    public static var GENRE_LIST = [Genre]()
    
    //MARK: - Segue Identifier
    public static var MOVIE_DETAIL_SEGUE = "movie_details"
    
    //MARK: - Alerts Headers
    static let ALERT_HEADER = "Movieify"
    static let MOVIE_SAVE_SUCCESSFULLY = "Movie added to favourite list successfully"
    static let MOVIE_SAVE_FAILED = "Movie added to favourite list is failed"
    static let MOVIE_REMOVE_FAILED = "Remove favourite failed"
}
