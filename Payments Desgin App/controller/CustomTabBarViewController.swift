//
//  ViewController.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomTabBarViewController:UITabBarController {

    var homeViewController:UIViewController!
    var statisticsViewController:UIViewController!
    var notificationViewController:UIViewController!
    var userViewController:UIViewController!
    
    var tabItem = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = HomeViewController()
        homeViewController = vc1
        
        let vc2 = HomeViewController()
        statisticsViewController = vc2
        
        let vc3 = HomeViewController()
        notificationViewController = vc3
        
        let vc4 = HomeViewController()
        userViewController = vc4
        
        viewControllers = [homeViewController , statisticsViewController , notificationViewController , userViewController]
        
        setUpViews()
        
        customTab(selectedImage: "home-selected", deselectedImage: "home", indexOfTab: 0 , tabTitle: "")
        customTab(selectedImage: "statistics-selected", deselectedImage: "statistics", indexOfTab: 1 , tabTitle: "")
        customTab(selectedImage: "notif-selected", deselectedImage: "notif", indexOfTab: 2 , tabTitle: "")
        customTab(selectedImage: "user-selected", deselectedImage: "user", indexOfTab: 3 , tabTitle: "")
    }
    
    func setUpViews(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = .white
        self.tabBar.layer.cornerRadius = 40
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func customTab(selectedImage image1 : String , deselectedImage image2: String , indexOfTab index: Int , tabTitle title: String ){

        let selectedImage = UIImage(named: image1)!.withRenderingMode(.alwaysOriginal)
        let deselectedImage = UIImage(named: image2)!.withRenderingMode(.alwaysOriginal)
        
        tabItem = self.tabBar.items![index]
        tabItem.image = deselectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = .none
        tabItem.imageInsets.bottom = -20
    }
    
}
