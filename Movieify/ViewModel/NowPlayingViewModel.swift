//
//  NowPlayingViewModel.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-21.
//

import Foundation

class NowPlayingViewModel {
    
    public var totalPages = 0
    public var page  = 0
    public var isLoad = false
    
    func loadNowPlayingMovies(completion: @escaping (Result<[Movie], APIErrors>)->Void) {
        
        if isLoad {return}
        
        isLoad = true
        
        page += 1
        
        if totalPages != 0 && totalPages < page  {
            
            completion(.failure(.pageLimitExceed))
            print("page limit exceed")
            return
        }
        
        MovieAPI.getMovieList(page: page) { [self] result in
            
            switch result {
                
            case .success(let res):
                
                isLoad = false
                
                totalPages = res.totalPages ?? 0
                
                if let list = res.results {
                    completion(.success(list))
                }else {
                    completion(.failure(.unableToComplete))
                }
                
                
            case .failure(let err):
                
                isLoad = false
                completion(.failure(err))
            }
            
        }
        
    }
}
