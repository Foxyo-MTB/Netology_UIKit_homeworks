//
//  LoginView.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 15.02.2023.
//

import UIKit
import SnapKit

final class LoginView: UIView {
    
    private(set) var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
  
    private let logoView: UIImageView = {
        let view = UIImageView()
        view.image = Images.logo
        return view
    }()
    
    private let loginTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Email of phone"
        textField.textColor = .black
        textField.font = Fonts.systemFont(size: 16, weight: .regular)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorSet.bluePixel // С макетом какая-то беда, я цвет просто взял нужный
        button.setTitle("Log in", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    func checkLoginButtonStates() {
        switch loginButton.state {
        case .normal: loginButton.alpha = 1
        case .selected: loginButton.alpha = 0.8
        case .highlighted: loginButton.alpha = 0.8
        case .disabled: loginButton.alpha = 0.8
        default:
            break
        }
    }
    
    func pushVCAddTarget(target: Any?, action: Selector) {
        loginButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemYellow
        checkLoginButtonStates()
        setupView()
        loginTextField.roundCorners(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 10)
        passwordTextField.roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    
    private func setupView() {
        
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    
        scrollView.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
        }

        scrollView.addSubview(loginTextField)
        loginTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(logoView.snp.bottom).offset(120)

        }

        scrollView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(-0.5)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }

        scrollView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
}

//MARK: - Extension to round corners

extension UIView {
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = [CACornerMask]
    }
}

