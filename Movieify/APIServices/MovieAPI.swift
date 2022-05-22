//
//  MovieAPI.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-21.
//

import Foundation
import Alamofire

struct MovieAPI {
    
    static func getMovieList(page: Int, completed: @escaping(Result<MoviesResponse, APIErrors>)-> Void) {
        
        let url =  "\(Constant.API_BASE_URL)movie/now_playing?page=\(page)&"
        
        let request = BaseService.shared.generateRequest(url: url, method: .get, body: nil)
        
        AF.request(request).validate().responseDecodable(of: MoviesResponse.self, decoder: BaseService.shared.decoder) { (response) in
            
            switch response.result {
                
            case .success(let result):
                
                completed(.success(result))
                
            case .failure(let error):
                
                print("Error from getMovieList: - \(error)")
                
                if error.isResponseSerializationError {
                    
                    completed(.failure(.invalidResponse))
                    
                } else {
                    completed(.failure(.unableToComplete))
                }
            }
        }
    }
}
