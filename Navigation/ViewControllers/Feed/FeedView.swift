//
//  FeedView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit
//import SnapKit

final class FeedView: UIView {
    
    private(set) var postButtonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post first", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) var postButtonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post second", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postButtonOne, postButtonTwo])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setFeedView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints extension

extension FeedView {
    
    private func setFeedView() {
        
        self.backgroundColor = .white
        
        addSubview(postStackView)
        NSLayoutConstraint.activate([
            postStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            postStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            postButtonOne.widthAnchor.constraint(equalTo: postStackView.widthAnchor),
            postButtonOne.heightAnchor.constraint(equalToConstant: 50),
            
            postButtonTwo.widthAnchor.constraint(equalTo: postStackView.widthAnchor),
            postButtonTwo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
