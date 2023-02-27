//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let baseView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseView)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
    }
}
