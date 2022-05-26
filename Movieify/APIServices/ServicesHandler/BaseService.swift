//
//  BaseService.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-20.
//

import Foundation
import Alamofire

class BaseService {
    
    public static let shared = BaseService()
    public let decoder = JSONDecoder()
    
    private let formatter = DateFormatter()
    
    private var request = URLRequest(url: URL(string: Constant.API_BASE_URL)!)
    
    private init() {
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            self.formatter.dateFormat = "yyyy-MM-dd"
            self.formatter.timeZone   = TimeZone(abbreviation: "UTC")
            
            if let date = self.formatter.date(from: dateString) {
                return date
            } else {
                
                print("Cannot decode date string \(dateString)")
                return self.formatter.date(from: "1000-01-01")!
            }
            
            
        }
    }
    
    public func generateRequest(url: String, method: HTTPMethod, body: Data?) -> URLRequest {
        
        guard let formateUrl = URL(string: url + "api_key=\(Constant.MOVIE_API_KEY)") else {
            fatalError("Invalid URL \(url)")
        }
        
        request.url      = formateUrl
        request.method   = method
        
        if let body_data = body {
            request.httpBody = body_data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
            
        return request
    }
}
