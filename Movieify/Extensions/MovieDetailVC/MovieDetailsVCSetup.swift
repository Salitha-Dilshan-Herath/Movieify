//
//  MovieDetailsVCSetup.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-27.
//

import Foundation
import UIKit
import SDWebImage

extension MovieDetailVC {
    
    func setupUI() {
        
        self.isFavMovie = coreDataManger.isFavMovieExists(id: (isFavOption ? Int(self.selectedFavMovie.id) : self.selectedMovie.id ?? 0))
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.timeZone   = TimeZone(abbreviation: "UTC")
        
        btnBack.layer.cornerRadius = 0.5 * btnBack.bounds.size.width
        btnBack.clipsToBounds = true
        
        btnRelaseDate.layer.cornerRadius = 10
        btnRelaseDate.layer.borderColor  = UIColor.systemYellow.cgColor
        btnRelaseDate.layer.borderWidth  = 1
        
        viwFav.layer.cornerRadius = 10
        viwFav.layer.borderColor  = UIColor.red.cgColor
        viwFav.layer.borderWidth  = 1
        
        viwLanguage.layer.cornerRadius = 10
        viwLanguage.layer.borderColor  = UIColor.red.cgColor
        
        imgPoster.layer.cornerRadius = 10

        imgBackDrop.sd_imageIndicator = SDWebImageActivityIndicator.gray
    
    
        if let path = (isFavOption ? selectedFavMovie.backdropPath : selectedMovie.backdropPath),  let backdrop_url = URL(string: Constant.RESOURCE_BASE_URL + path) {
            
            imgBackDrop.sd_setImage(with: backdrop_url)
        }
        
        if let path =  (isFavOption ? selectedFavMovie.posterPath : selectedMovie.posterPath),  let poster_url = URL(string: Constant.RESOURCE_BASE_URL + path) {
            
            imgPoster.sd_setImage(with: poster_url)
            imgPoster.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
        
        //Show Title
        lblName.text = isFavOption ? selectedFavMovie.title : selectedMovie.title

        //Show Genres List
        
        if isFavOption {
            
            lblGenre.text = selectedFavMovie.genres
            
        } else{
            
            var genreStr = ""
            
            selectedMovie.genreIds?.forEach{ id in
                
                if let item = Constant.GENRE_LIST.first(where: { $0.id == id }) {
                    genreStr += "\(item.name), "
                }
            }
            
            lblGenre.text = "\(genreStr.trimmingCharacters(in: .whitespaces).dropLast())"
        }
     
        
        //Show Release Date
        if let release_date = (isFavOption ? selectedFavMovie.releaseDate : selectedMovie.releaseDate)  {
            
            let date = dateFormatter.string(from: release_date)
            
            if date == "01 Jan 1000" {
                btnRelaseDate.setTitle("Release date not available", for: .normal)
            } else {
                btnRelaseDate.setTitle("Release on \(date)", for: .normal)
            }
        }
        
        if isFavOption {
            lblOverview.text = selectedFavMovie.overview
        } else {
            if ((selectedMovie.overview?.isEmpty ?? true)) {
                lblOverview.text = "Not Available"
            } else {
                lblOverview.text = selectedMovie.overview
            }
        }
        
        
        
        lblLanguage.text = isFavOption ? selectedFavMovie.originalLanguage?.uppercased() : selectedMovie.originalLanguage?.uppercased()
        
        //Show Vote Average
        lblVote.text = "\(isFavOption ? selectedFavMovie.voteAverage :selectedMovie.voteAverage ?? 0) Rating"
        
        //Show Vote Count
        lblVoteCount.text = "\(isFavOption ? Int(selectedFavMovie.voteCount) : selectedMovie.voteCount ?? 0) Votes"
        
    }
}
