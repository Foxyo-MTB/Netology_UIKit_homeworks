//
//  FeedView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit

final class FeedView: UIView {
    
    // Если же переносить .addTarget в замыкание, то такой вариант я придумал, но не додумал =)
    private let postButtonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post first", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(FeedView.self, action: #selector(getter: actionButton), for: .touchUpInside) // Вот тут я думал-думал, как исправить замечание Алексея Павлова из пердыдущего дз, чтобы .addTarget был в замыкании и не придумал, подскажите, пожалуйста, как правильно сделать? Не понятно, как передавать navigation controller. Придумал только способ, как в postButtonTwo()
        return button
    }()
    
    private let postButtonTwo: UIButton = {
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
    
    // Один способ передачи данных для нажатия на кнопку, .addTarget не в замыкании
    func pushVCAddTarget(target: Any?, action: Selector) {
        postButtonTwo.addTarget(target, action: action, for: .touchUpInside)
    }
    
    // Для .addTarget в замыкании
    @objc private var actionButton: ()->()
    private var target: UIViewController
    
    init(target: UIViewController, actionButton: @escaping ()-> Void) {
        self.actionButton = actionButton
        self.target = target
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


