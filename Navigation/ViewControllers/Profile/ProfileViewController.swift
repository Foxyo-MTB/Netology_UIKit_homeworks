//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let baseView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.frame = view.bounds
        view.addSubview(baseView)
        navigationItem.title = "Profile"
        baseView.statusButtonPassesToVC().addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
    }
        
    @objc private func statusButtonPressed() {
        baseView.statusLabelPassesToVC().text = baseView.statusTextFieldPassesToVC().text
    }
}
