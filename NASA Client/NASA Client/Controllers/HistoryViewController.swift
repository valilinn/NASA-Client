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
    weak var delegate: RealmSavedFiltersDelegate?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundOne
        historyView.tableView.delegate = self
        historyView.tableView.dataSource = self
        setNavBar()
        getSavedFilters()
        setView()
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
    
    private func updateSavedFilters() {
        getSavedFilters()
        historyView.tableView.reloadData()
    }
    
    private func setView() {
        view = filters.isEmpty ? HistoryEmptyView() : historyView
    }
    
    private func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.tabBarItem.isEnabled = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .accentOne
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        setNavBarButton()
        setNavBarTitle()
    }
    
    private func setNavBarButton() {
        backButton.setImage(.arrowCircleLeft, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = backButtonItem
    }
    
    private func setNavBarTitle() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        titleLabel.text = "History"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .layerOne
        titleLabel.font = CustomFont.largeTitle
        titleView.addSubview(titleLabel)
        
        navigationItem.titleView = titleView
        navigationItem.title = ""
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
        
        if let dateFormatted = CustomDateFormatter.formatToDateForView(filters[indexPath.row].date) {
            cell.configure(rover: filters[indexPath.row].rover, camera: filters[indexPath.row].camera, date: dateFormatted)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        AlertHelper.showUseFilterAlert(in: self) { [weak self] in
            guard let filter = self?.filters[indexPath.row] else { return }
            self?.delegate?.useSavedFilter(rover: filter.rover, camera: filter.camera, date: filter.date)
            
            if let navigationController = self?.navigationController {
                navigationController.popViewController(animated: true)
            }
        } onDelete: { [weak self] in
            guard let filterToDelete = self?.filters[indexPath.row] else { return }
            try! self?.realm.write{
                self?.realm.delete(filterToDelete)
                self?.updateSavedFilters()
                self?.setView()
            }
        }
    }
}


