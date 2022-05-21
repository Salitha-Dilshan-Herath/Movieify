//
//  ViewController.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-20.
//

import UIKit

class NowPlayingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieAPI.getMovieList() { result in
            
            switch result {
                
            case .success(let data):
                print(data)
                
            case .failure(let error):
                print(error)
            }
            
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: "Now Playing", preferredLargeTitle: true)
    }
}


