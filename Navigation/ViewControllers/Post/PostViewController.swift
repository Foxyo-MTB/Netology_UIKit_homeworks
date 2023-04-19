//
//  PostViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    private let baseView = PostView()
    private let feedVC = FeedViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseView)
        navigationItem.title = feedVC.providePostObject().title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(goToInfo))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
    }
    
    @objc private func goToInfo() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
}
