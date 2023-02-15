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
        navigationController?.navigationBar.isHidden = false
        baseView.statusButtonAddTarget(target: self, action: #selector(statusButtonPressed))
    }
        
    @objc private func statusButtonPressed() {
        baseView.statusLabel.text = baseView.statusTextField.text
    }
}
