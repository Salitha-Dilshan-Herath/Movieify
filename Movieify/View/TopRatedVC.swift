//
//  TopRatedVC.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-20.
//

import UIKit

class TopRatedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: "Top Rated", preferredLargeTitle: true)
    }
    
}
