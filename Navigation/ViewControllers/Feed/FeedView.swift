//
//  FeedView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 31.01.2023.
//

import UIKit
import SnapKit

final class FeedView: UIView {

    private let postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    func providePostButtonToVC() -> UIButton {
        postButton
    }
    
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
        addSubview(postButton)
        postButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
    }
}
