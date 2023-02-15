//
//  LogInViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 15.02.2023.
//

import UIKit
import SnapKit

final class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default
    private let baseView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToHideKeyboardOnTapOnView()
        baseView.frame = view.bounds
        view.addSubview(baseView)
        navigationController?.navigationBar.isHidden = true
        baseView.pushVCAddTarget(target: self, action: #selector(logInButtonPressed))
    }
    
    @objc private func logInButtonPressed() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
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

extension LogInViewController {
    
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(LogInViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
