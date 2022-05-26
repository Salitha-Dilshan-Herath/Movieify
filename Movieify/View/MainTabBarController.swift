//
//  MainTabBarController.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-23.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    
    let search = UISearchController(searchResultsController: nil)
    var isHide = false
    
    @IBOutlet var searchField: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .red, tintColor: .white, title: Constant.NOW_PLAYING_TITLE, preferredLargeTitle: true)

    }
    
    @IBAction func searchBtnTap(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func favBtnTap(_ sender: Any) {
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouriteVC") as! FavouriteVC
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController is NowPlayingVC {
            navigationItem.title = "Now Playing"
            
        } else if viewController is PopularVC {
            navigationItem.title = "Popular"
            
        } else if viewController is TopRatedVC {
            navigationItem.title = "Top Rated"
            
        } else if viewController is UpcomingVC {
            navigationItem.title = "Upcoming"
            
        }
        
    }
}

