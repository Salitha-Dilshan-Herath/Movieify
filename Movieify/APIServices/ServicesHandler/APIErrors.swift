//
//  APIError.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-21.
//

import Foundation

enum APIErrors: String, Error {
    
    case invalidResponse  = "Invalid response from server. Please try again."
    case unableToComplete = "Unable to complete your request. Something went wrong."
    case pageLimitExceed = "No more data available"

}
