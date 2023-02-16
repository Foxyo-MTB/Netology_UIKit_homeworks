//
//  ProfileView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 07.02.2023.
//

import UIKit
import SnapKit

final class ProfileHeaderView: UIView {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profilePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = Images.profilePhoto
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cool parrot"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12                        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Тут установлен статус"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var statusTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Введите статус"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change title?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func statusButtonAddTarget(target: Any?, action: Selector) {
        statusButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileHeaderView {
    
    private func setupView() {
        
        backgroundColor = .white
        
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(220)
        }
        
        backgroundView.addSubview(profilePhoto)
        profilePhoto.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(16)
            make.height.width.equalTo(100)
        }
        
        backgroundView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(27)
            make.left.equalTo(profilePhoto.snp.right).offset(16)
        }
        
        backgroundView.addSubview(statusButton)
        statusButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.top.equalTo(profilePhoto.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        
        backgroundView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.bottom.equalTo(statusButton.snp.top).offset(-50)
            make.left.equalTo(nameLabel.snp.left)
            make.right.equalToSuperview().offset(-16)
        }
        
        backgroundView.addSubview(statusTextField)
        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(5)
            make.leading.equalTo(statusLabel.snp.leading)
            make.height.equalTo(40)
            make.trailing.equalTo(statusButton.snp.trailing)
        }
        
        addSubview(newButton)
        newButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
