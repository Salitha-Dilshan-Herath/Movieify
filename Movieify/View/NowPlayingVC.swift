//
//  ViewController.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-20.
//

import UIKit

class NowPlayingVC: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var tblMovie: UITableView!
    
    //MARK: - Variable
    let viewModel = NowPlayingViewModel()
    var movieList = [Movie]()
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: Constant.NOW_PLAYING_TITLE, preferredLargeTitle: true)
    }
    
    //MARK: - Custom Methods
    func getMovies(reset: Bool)  {
        
        if reset {
            viewModel.page    = 0
            viewModel.isLoad  = false
        }
        
        viewModel.loadNowPlayingMovies() { result in
            
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



