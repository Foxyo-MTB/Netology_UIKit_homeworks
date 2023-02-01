//
//  InfoViewController.swift
//  Navigation
//
//  Created by Vladimir Beliakov on 01.02.2023.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private let baseView = InfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.provideInfoButton().addTarget(self, action: #selector(pressButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    @objc private func pressButtonPressed() {
        
        let secondAlert = UIAlertController(title: "А вот не хочу я печатать в консоль, сюда хочу печатать!", message: "", preferredStyle: .alert)
        let secondCancelAction = UIAlertAction(title: "Закрой меня", style: .default)
        secondAlert.addAction(secondCancelAction)
        
        let alert = UIAlertController(title: "Alert для домашнего задания", message: "На выбор тебе две кнопки - жми", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Кнопка два", style: .default) { _ in
            self.present(secondAlert, animated: true)
            print("Сообщение в консоль тоже выведу, а то в дз написано =)")
        }
        let cancelAction = UIAlertAction(title: "Кнопка один", style: .default)
        alert.addAction(cancelAction)
        alert.addAction(firstAction)
        present(alert, animated: true)
        
        
    }

}
