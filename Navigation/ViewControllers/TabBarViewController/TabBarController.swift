//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 01.02.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
    private let profileNavigationController = UINavigationController(rootViewController: LogInViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        self.tabBar.backgroundColor = .white
        viewControllers = [feedNavigationController, profileNavigationController]
        feedNavigationController.tabBarItem.title = "Feed"
        feedNavigationController.tabBarItem.image = TabBarPictures.feedImage
        profileNavigationController.tabBarItem.title = "Profile"
        profileNavigationController.tabBarItem.image = TabBarPictures.profileImage
    }
}
