//
//  MovieDetailVC.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-23.
//

import UIKit
import SDWebImage

class MovieDetailVC: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var imgBackDrop: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var btnRelaseDate: UIButton!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var viwLanguage: UIView!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblVote: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    @IBOutlet weak var viwFav: UIView!
    
    //MARK: - Instance Variables
    var selectedMovie = Movie()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }

    @IBAction func backBtn(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setupUI() {
        
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
    
        if let path = selectedMovie.backdropPath,  let backdrop_url = URL(string: Constant.RESOURCE_BASE_URL + path) {
            
            imgBackDrop.sd_setImage(with: backdrop_url)
        }
        
        if let path = selectedMovie.posterPath,  let poster_url = URL(string: Constant.RESOURCE_BASE_URL + path) {
            
            imgPoster.sd_setImage(with: poster_url)
            imgPoster.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
        
        //Show Title
        lblName.text = selectedMovie.title

        //Show Genres List
        var genreStr = ""
        
        selectedMovie.genreIds?.forEach{ id in
            
            if let item = Constant.GENRE_LIST.first(where: { $0.id == id }) {
                genreStr += "\(item.name), "
            }
        }
        
        lblGenre.text = "\(genreStr.trimmingCharacters(in: .whitespaces).dropLast())"
        
        //Show Release Date
        if let release_date = selectedMovie.releaseDate  {
            
            let date = dateFormatter.string(from: release_date)
            
            btnRelaseDate.setTitle("Release on \(date)", for: .normal)
        }
        
        lblOverview.text = selectedMovie.overview
        
        lblLanguage.text = selectedMovie.originalLanguage?.uppercased()
        
        //Show Vote Average
        lblVote.text = "\(selectedMovie.voteAverage ?? 0) Rating"
        
        //Show Vote Count
        lblVoteCount.text = "\(selectedMovie.voteCount ?? 0) Votes"
        
    }
}
