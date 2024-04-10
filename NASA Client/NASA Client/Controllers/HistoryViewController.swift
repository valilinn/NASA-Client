//
//  HistoryViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit
import RealmSwift

class HistoryViewController: UIViewController {
    
    private let historyView = HistoryView()
    private let backButton = UIButton()
    private let cellHeight: CGFloat = 150
    private var filters = [Filters]() 
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = historyView
        view.backgroundColor = .backgroundOne
        historyView.tableView.delegate = self
        historyView.tableView.dataSource = self
        setNavBar()
        getSavedFilters()
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        

        navigationController?.setNavigationBarHidden(false, animated: true)
        //navigationController?.viewControllers.first?.navigationItem.title = "HHHHH" title of the back button
        navigationController?.tabBarItem.isEnabled = true
//        navigationController?.navigationBar.barTintColor = .blue
        
//        navigationController?.navigationBar.isTranslucent = true
//        UINavigationBar.appearance().backgroundColor = .green
//        UINavigationBar.appearance().tintColor = .orange
//        UINavigationBar.appearance().barTintColor = .cyan
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .accentOne
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
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
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 40))
            titleLabel.text = "History"
            titleLabel.textAlignment = .center
            titleLabel.textColor = .layerOne // Установите цвет текста по вашему выбору
            titleLabel.font = CustomFont.largeTitle // Установите шрифт по вашему выбору
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
    
    private func getSavedFilters() {
        let filtersResults = realm.objects(Filters.self)
        filters = Array(filtersResults)
        historyView.tableView.reloadData()
        print("I have filters \(filters)")
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        filters.isEmpty ? 0 : filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryViewCell.reuseID, for: indexPath) as! HistoryViewCell
        
        cell.configure(rover: filters[indexPath.row].rover, camera: filters[indexPath.row].camera, date: filters[indexPath.row].date)

        return cell
    }
    
    
}


