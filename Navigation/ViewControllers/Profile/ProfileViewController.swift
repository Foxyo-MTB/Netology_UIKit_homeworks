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
        view.addSubview(baseView)
        navigationItem.title = "Profile"
        navigationController?.navigationBar.isHidden = false
        baseView.statusButtonAddTarget(target: self, action: #selector(statusButtonPressed))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
    }
        
    @objc private func statusButtonPressed() {
        baseView.statusLabel.text = baseView.statusTextField.text
    }
}
