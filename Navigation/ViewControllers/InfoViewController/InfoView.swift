//
//  InfoView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 01.02.2023.
//

import UIKit
import SnapKit

final class InfoView: UIView {
    
    private let pressButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Press button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemYellow
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func provideInfoButton() -> UIButton {
        pressButton
    }
    
}

extension InfoView {
    
    private func setupView() {
        
        addSubview(pressButton)
        pressButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
    }
    
}
