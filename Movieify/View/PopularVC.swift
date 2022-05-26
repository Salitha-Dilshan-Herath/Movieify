//
//  PopularVC.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-20.
//

import UIKit

class PopularVC: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet weak var tblMovie: UITableView!
    
    //MARK: - Variable
    let viewModel = MovieViewModel()
    var movieList = [Movie]()
    var selectedMovie = Movie()

    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getMovies(reset: true)
        
       
    }
    
    //MARK: - Custom Methods
    func getMovies(reset: Bool)  {
        
        if reset {
            viewModel.page    = 0
            viewModel.isLoad  = false
            movieList.removeAll()
        }
        
        viewModel.loadMovies(movieType: .popular) { result in
            
            switch result {
                
            case .success(let list):
                
                self.movieList.append(contentsOf: list)
                self.tblMovie.reloadData()
                
            case .failure(let error):
                
                print(error.rawValue)
            }
        }
    }
}
