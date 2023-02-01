//
//  MainViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private var baseView = FeedView()
    private let postObject = Post(title: "Here's the title!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.providePostButtonToVC().addTarget(self, action: #selector(postButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    @objc private func postButtonPressed() {
        print(#function)
        navigationController?.pushViewController(PostViewController(), animated: true)
       }
    
    func providePostObject() -> Post {
        postObject
    }

}
