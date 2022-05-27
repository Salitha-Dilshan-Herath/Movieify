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
    @IBOutlet weak var lblFav: UILabel!
    @IBOutlet weak var imgFav: UIImageView!
    
    //MARK: - Instance Variables
    var selectedMovie = Movie()
    var selectedFavMovie: FavMovie!

    let dateFormatter = DateFormatter()
    var isOption = false
    let coreDataManger = CoreDataManager()
    var isFavMovie = false {
        didSet {
            
            viwFav.layer.cornerRadius = 10
            viwFav.layer.borderColor  = UIColor.red.cgColor
            viwFav.layer.borderWidth  = 1
            
            if isFavMovie {
                viwFav.backgroundColor = UIColor.red
                lblFav.text = "Remove from Favourites"
                lblFav.textColor = UIColor.white
                imgFav.tintColor = UIColor.white
                
            } else {
                viwFav.backgroundColor = UIColor.white
                lblFav.text = "Add to Favourites"
                lblFav.textColor = UIColor.red
                imgFav.tintColor = UIColor.red
            }
        }
    }
    var isFavOption = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }

    @IBAction func backBtn(_ sender: Any) {
        
        if isOption || isFavOption {
            self.dismiss(animated: true)
        } else{
            _ = navigationController?.popViewController(animated: true)
        }
       
    }
    
    @IBAction func favBtnTap(_ sender: Any) {
        
        if !isFavMovie {
            
            let favMovie = FavouriteMovie(adult: self.selectedMovie.adult ?? false, backdropPath: self.selectedMovie.backdropPath ?? "", genreIds: lblGenre.text!, id: self.selectedMovie.id ?? 0, originalLanguage: self.selectedMovie.originalLanguage ?? "", originalTitle: self.selectedMovie.originalTitle ?? "", overview: lblOverview.text!, popularity: self.selectedMovie.popularity ?? 0, posterPath: self.selectedMovie.posterPath ??  "", releaseDate: self.selectedMovie.releaseDate!, title: self.selectedMovie.title ?? "", video: self.selectedMovie.video ?? false, voteAverage: self.selectedMovie.voteAverage ?? 0 , voteCount: self.selectedMovie.voteCount ?? 0)
            
            
            coreDataManger.saveFavMovie(movie: favMovie) { result in
                
                if result {
                    
                    Alert.showMessage(msg: Constant.MOVIE_SAVE_SUCCESSFULLY, on: self)
                    self.isFavMovie = true
                    
                } else {
                    Alert.showMessage(msg: Constant.MOVIE_SAVE_FAILED, on: self)
                }
            }
            
        } else {
          
            coreDataManger.deleteFavMovie(id: (isFavOption ? Int(self.selectedFavMovie.id) : self.selectedMovie.id ?? 0)) { [self] result in
                
                if result {
                    self.isFavMovie = false
                    
                    if isFavOption {
                        self.dismiss(animated: true)
                    }
                    
                } else {
                    Alert.showMessage(msg: Constant.MOVIE_REMOVE_FAILED, on: self)
                }
            }
        }
    }
    
   
}
