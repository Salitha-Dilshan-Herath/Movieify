//
//  FavouriteVCSetup.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-27.
//

import Foundation
import UIKit

extension FavouriteVC {
    
    //MARK: - Setup main ui
    func setupUI() {
        
        tblMovie.register(UINib(nibName: Constant.MOVIE_TABLE_CELL, bundle: nil), forCellReuseIdentifier: Constant.MOVIE_TABLE_CELL)
        tblMovie.tableFooterView = UIView()
        tblMovie.estimatedRowHeight = UITableView.automaticDimension
        
        MovieAPI.getGenreList() { result in
            
            switch result {
                
            case .success(let response):
                
                if let list = response.genres {
                    Constant.GENRE_LIST = list
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let movieDetailsVC = segue.destination as? MovieDetailVC{
            
            movieDetailsVC.isFavOption = true
            movieDetailsVC.selectedFavMovie = self.selectedMovie
        }
        
    }
}

//MARK: - Table view setup
extension FavouriteVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.MOVIE_TABLE_CELL, for: indexPath) as! MovieTVC
        
        cell.setupFavUI(movie: self.movieList[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.movieList[indexPath.row]
        self.selectedMovie = data
        
        self.performSegue(withIdentifier: Constant.MOVIE_DETAIL_SEGUE, sender: nil)
    }
}
