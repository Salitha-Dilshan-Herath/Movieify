//
//  MovieTVC.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-21.
//

import UIKit
import SDWebImage

class MovieTVC: UITableViewCell {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var viwContent: UIView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    
    
    let dateFormatter = DateFormatter()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgPoster.layer.cornerRadius = 10
        imgPoster.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
        viwContent.layer.cornerRadius = 10
        
        dateFormatter.dateFormat = "dd/MMM/yyyy"
        dateFormatter.timeZone   = TimeZone(abbreviation: "UTC")
    }

    func setupUI(movie: Movie){
        
        if let path = movie.posterPath,  let poster_url = URL(string: Constant.RESOURCE_BASE_URL + path) {
            imgPoster.sd_setImage(with: poster_url)
        }
        
        lblMovieName.text = movie.title

        var genreStr = ""
        
        movie.genreIds?.forEach{ id in
            
            if let item = Constant.GENRE_LIST.first(where: { $0.id == id }) {
                genreStr += " \(item.name),"
            }
        }
        
        
        lblGenre.text = "Genre: -\(genreStr.dropLast())"
        
        if let release_date = movie.releaseDate  {
            
            let date = dateFormatter.string(from: release_date)
            
            lblReleaseDate.text = "Release Date:- \(date)"
        }
        
        lblRatings.text = "\(movie.voteAverage ?? 0)"
    }
    
}
