//
//  SearchVC.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-26.
//

import UIKit

class SearchVC: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var tblMovie: UITableView!
    @IBOutlet weak var txtSeachBar: UISearchBar!
    
    //MARK: - Variable
    let viewModel = MovieViewModel()
    var movieList = [Movie]()
    var selectedMovie = Movie()
    var searchText = ""
    
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Custom Methods
    func getMovies(reset: Bool, search: String)  {
        
        tblMovie.isHidden = false
        
        if reset {
            viewModel.page    = 0
            viewModel.isLoad  = false
            movieList.removeAll()
        }
        
        viewModel.searchMovies(text: search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") { [self] result in
            
            switch result {
                
            case .success(let list):
            
                self.movieList.append(contentsOf: list)
                
                if self.movieList.count > 0 {
                    self.tblMovie.reloadData()
                } else {
                    tblMovie.isHidden = true
                }
                
                
            case .failure(let error):
                
                print(error.rawValue)
            }
        }
    }
}
