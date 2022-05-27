//
//  FavouriteVC.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-27.
//

import UIKit

class FavouriteVC: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var tblMovie: UITableView!
    
    //MARK: - Variable
    let viewModel = MovieViewModel()
    var movieList = [FavMovie]() {
        didSet {
            
            if movieList.count > 0 {
                self.tblMovie.isHidden = false
                self.tblMovie.reloadData()
            } else {
                self.tblMovie.isHidden = true
            }
            
        }
    }
    
    var selectedMovie: FavMovie!
    let coreDataManger = CoreDataManager()

    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getMovies()
    }
    
    //MARK: - Custom Methods
    func getMovies()  {
        
        self.movieList = coreDataManger.getFavMovieList()

        
    }
}
