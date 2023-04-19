//
//  LogInViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 15.02.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    private let baseView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.loginTextField.text = "email@yandex.ru"
        baseView.passwordTextField.text = "Password"
        setupToHideKeyboardOnTapOnView()
        view.addSubview(baseView)
        navigationController?.navigationBar.isHidden = true
        baseView.pushVCAddTarget(target: self, action: #selector(logInButtonPressed))
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func checkLogin() {
        if baseView.loginTextField.text?.isEmpty == true {
            baseView.shakeAnimationForTextField(textField: baseView.loginTextField)
        }
    }
    
    private func checkPassword() {
        if baseView.passwordTextField.text?.isEmpty == true {
            baseView.shakeAnimationForTextField(textField: baseView.passwordTextField)
        }
    }
    
    private func checkCredentials() {
        if (baseView.loginTextField.text?.isEmpty != true &&
            baseView.loginTextField.text != Credentials.login &&
            isValidEmail(baseView.loginTextField.text!) != true) ||
            (baseView.passwordTextField.text?.isEmpty != true &&
             baseView.passwordTextField.text != Credentials.password &&
             baseView.checkPasswordLengthAndDisplayWarning())
        {
            let alert = UIAlertController(title: "Неправильный логин или пароль", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Понятно!", style: .default)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
    }
    
    private func correctLogin() {
        if baseView.loginTextField.text?.isEmpty != true &&
            baseView.passwordTextField.text?.isEmpty != true &&
            baseView.checkPasswordLengthAndDisplayWarning() &&
            baseView.loginTextField.text == Credentials.login &&
            baseView.passwordTextField.text == Credentials.password &&
            isValidEmail(baseView.loginTextField.text!) == true
        {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        }
    }
    
    @objc private func logInButtonPressed() {
        checkLogin()
        checkPassword()
        checkCredentials()
        correctLogin()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            baseView.scrollView.contentInset.bottom = keybordSize.height
            baseView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        baseView.scrollView.contentInset = .zero
        baseView.scrollView.verticalScrollIndicatorInsets = .zero
        
    }
}

extension LoginViewController {
    
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
