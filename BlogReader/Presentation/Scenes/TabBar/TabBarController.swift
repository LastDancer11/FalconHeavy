//
//  TabBarController.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = self.viewControllers![0] as! HomeViewController
        vc1.coordinator = coordinator
        
        let vc2 = self.viewControllers![1] as! FavouritesViewController
        vc2.coordinator = coordinator
        
        let vc3 = self.viewControllers![2] as! NewsViewController
        vc3.coordinator = coordinator
        
        let vc4 = self.viewControllers![3] as! FeedViewController
        vc4.coordinator = coordinator
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
