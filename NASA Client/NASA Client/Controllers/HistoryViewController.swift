//
//  HistoryViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit

class HistoryViewController: UIViewController {
    
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundOne
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.barTintColor = .green
//        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        //navigationController?.viewControllers.first?.navigationItem.title = "HHHHH" title of the back button
        navigationController?.tabBarItem.isEnabled = true
        
        backButton.setImage(.arrowCircleLeft, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        // Скрываем стандартную кнопку "Назад"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Устанавливаем свою собственную кнопку "Назад" в качестве левой кнопки навигационной панели
        navigationItem.leftBarButtonItem = backButtonItem
        
        // Создайте кастомное представление для центрального элемента
            let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            titleLabel.text = "History"
            titleLabel.textAlignment = .center
            titleLabel.textColor = .layerOne // Установите цвет текста по вашему выбору
            titleLabel.font = UIFont(name: "SFPro-Bold", size: 34) // Установите шрифт по вашему выбору
            titleView.addSubview(titleLabel)

            // Установите кастомное представление в качестве центрального элемента навигационной панели
            navigationItem.titleView = titleView

            // Удалите заголовок из навигационной панели (если требуется)
            navigationItem.title = ""
        
        }
    
    
    
    @objc
    private func backButtonTapped() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
}

