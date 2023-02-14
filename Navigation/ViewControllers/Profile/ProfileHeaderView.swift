//
//  ProfileView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 07.02.2023.
//

import UIKit

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
        imageView.image = AvatarPhotos.profilePhoto
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
        button.layer.cornerRadius = 12                              // В задании указано 4pt, но оно ваще ни разу не 4 =) указал 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Тут установлен статус"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: TextFieldWithPadding = {
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
        button.setTitle("Change title?", for: .normal)  // Это второй пункт дз, вот я тут что-то не понял, че за кнопка нужна.
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
    
    func statusButtonPassesToVC() -> UIButton {
        statusButton
    }
    
    func statusLabelPassesToVC() -> UILabel {
        statusLabel
    }
    
    func statusTextFieldPassesToVC() -> UITextField {
        statusTextField
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
        addSubview(newButton)
        backgroundView.addSubview(profilePhoto)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(statusButton)
        backgroundView.addSubview(statusLabel)
        backgroundView.addSubview(statusTextField)
        
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 220),
            
            profilePhoto.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 16),
            profilePhoto.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profilePhoto.heightAnchor.constraint(equalToConstant: 100),
            profilePhoto.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 16),
            
            statusButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            statusButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -32),
            statusButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 30),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -50),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -16),
            
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 5),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            
            newButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
