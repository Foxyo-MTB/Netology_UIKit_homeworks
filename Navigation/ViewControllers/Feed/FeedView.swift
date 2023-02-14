//
//  FeedView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit
import SnapKit

final class FeedView: UIView {
    
    private let postButtonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post first", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let postButtonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post second", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postButtonOne, postButtonTwo])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setFeedView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonsPassesToVC() -> [UIButton] {
        [postButtonOne,postButtonTwo]
    }
}

//MARK: - Constraints extension

extension FeedView {
    
    private func setFeedView() {
        
        self.backgroundColor = .white
        
        addSubview(postStackView)
        postStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        postButtonOne.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        postButtonTwo.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
