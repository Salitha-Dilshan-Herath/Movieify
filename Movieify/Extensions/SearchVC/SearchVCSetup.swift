//
//  SearchVCSetup.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-26.
//

import Foundation
import UIKit

extension SearchVC {
    
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
            
            movieDetailsVC.isOption = true
            movieDetailsVC.selectedMovie = self.selectedMovie
        }
        
    }
}

//MARK: - Table view setup
extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.MOVIE_TABLE_CELL, for: indexPath) as! MovieTVC
        
        cell.setupUI(movie: self.movieList[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.movieList.count {
            
            getMovies(reset: false, search: self.searchText)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.movieList[indexPath.row]
        self.selectedMovie = data
        
        self.performSegue(withIdentifier: Constant.MOVIE_DETAIL_SEGUE, sender: nil)
    }
}

extension SearchVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(SearchVC.reload), object: nil)
        self.perform(#selector(SearchVC.reload), with: nil, afterDelay: 0.5)
    }

    @objc func reload() {
        guard let searchtxt = txtSeachBar.text else { return }
        
        self.searchText = searchtxt.trimmingCharacters(in: .whitespaces)
        
        print(searchText)

        getMovies(reset: true, search: searchText)
    }
}
