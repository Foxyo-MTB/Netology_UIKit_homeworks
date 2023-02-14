//
//  InfoView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 01.02.2023.
//

import UIKit

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
        NSLayoutConstraint.activate([
            pressButton.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            pressButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            pressButton.heightAnchor.constraint(equalToConstant: 50),
            pressButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
