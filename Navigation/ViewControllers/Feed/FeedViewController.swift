//
//  MainViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private lazy var baseView = FeedView(target: self) {
        self.addButtonPressed()
    }
    
    private let postObject = Post(title: "Here's the title!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.frame = view.bounds
        view.addSubview(baseView)
        baseView.pushVCAddTarget(target: self, action: #selector(addButtonPressed))
    }
    
    @objc private func addButtonPressed() {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    func providePostObject() -> Post {
        postObject
    }
    
}

