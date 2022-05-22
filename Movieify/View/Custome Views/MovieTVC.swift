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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgPoster.layer.cornerRadius = 10
        imgPoster.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
        viwContent.layer.cornerRadius = 10
    }

    func setupUI(movie: Movie){
        
        if let path = movie.posterPath,  let poster_url = URL(string: Constant.RESOURCE_BASE_URL + path) {
            imgPoster.sd_setImage(with: poster_url)
        }
    }
    
}
