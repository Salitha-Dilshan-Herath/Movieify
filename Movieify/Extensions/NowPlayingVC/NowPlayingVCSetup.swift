//
//  NowPlayingVCSetup.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-22.
//

import Foundation
import UIKit

extension NowPlayingVC {
    
    //MARK: - Setup main ui
    func setupUI() {
        
        tblMovie.register(UINib(nibName: Constant.MOVIE_TABLE_CELL, bundle: nil), forCellReuseIdentifier: Constant.MOVIE_TABLE_CELL)
        tblMovie.tableFooterView = UIView()
        tblMovie.estimatedRowHeight = UITableView.automaticDimension
        
        getMovies(reset: true)
        
    }
}

//MARK: - Table view setup
extension NowPlayingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTVC", for: indexPath) as! MovieTVC
        
        cell.setupUI(movie: self.movieList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.movieList.count {
            
            getMovies(reset: false)
        }
    }
}
