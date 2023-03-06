//
//  MainViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let baseView = FeedView()
    
    private let postObject = Post(title: "Here's the title!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseView)
        baseView.pushVCAddTarget(target: self, action: #selector(addButtonPressed))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
    }
    
    
    @objc private func addButtonPressed() {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    func providePostObject() -> Post {
        postObject
    }
    
}

