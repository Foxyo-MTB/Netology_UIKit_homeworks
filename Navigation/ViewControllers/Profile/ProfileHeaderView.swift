//
//  ProfileView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 07.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private let profilePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = AvatarPhotos.profilePhoto
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cool parrot"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
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
        return button
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Тут установлен статус"
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
        return textField
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
        
        backgroundColor = .systemGray4   // Сорян, но .lightGray меня угнетал
        
        addSubview(profilePhoto)
        profilePhoto.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(16)
            make.height.width.equalTo(100)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(27)
            make.left.equalTo(profilePhoto.snp.right).offset(16)
        }
        
        addSubview(statusButton)
        statusButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.top.equalTo(profilePhoto.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        
        addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.bottom.equalTo(statusButton.snp.top).offset(-50)
            make.left.equalTo(nameLabel.snp.left)
            make.right.equalToSuperview().offset(-16)
        }
        
        addSubview(statusTextField)
        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(5)
            make.left.equalTo(statusLabel.snp.left)
            make.height.equalTo(40)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
}
