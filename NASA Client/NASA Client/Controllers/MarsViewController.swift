//
//  MarsViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit
import RealmSwift

class MarsViewController: UIViewController {
    
    let realm = try! Realm()
    
    private let marsView = MarsView()
    private var archiveButton = UIButton.floatingButton()
    private let cellHeight: CGFloat = 162
    private let spacingBetweenCells: CGFloat = 15
    private let overlayView = UIView()
    private var filters = Filters()

    private var roversData: MarsRover? {
        didSet {
            if let rover = roversData {
                fetchMarsRoverPhotos(rovers: rover, date: currentDate) { }
            }
        }
    }

    private var roverPhotosDataArray = [MarsRoverPhotos.Photo]() {
        didSet {
            marsView.tableViewHeightConstraint?.update(offset: CGFloat(roverPhotosDataArray.count) * cellHeight)
            DispatchQueue.main.async { [weak self] in
                self?.marsView.tableView.tableView.reloadData()
            }
        }
    }
    private var filteredMarsPhotos = [MarsRoverPhotos.Photo]() {
        didSet {
            marsView.tableViewHeightConstraint?.update(offset: CGFloat(filteredMarsPhotos.count) * cellHeight)
            DispatchQueue.main.async { [weak self] in
                self?.marsView.tableView.tableView.reloadData()
            }
        }
    }
    
    private var currentDate = CustomDateFormatter.getCurrentDate() {
        didSet {
            if let rover = roversData {
                filteredMarsPhotos.removeAll()
                fetchMarsRoverPhotos(rovers: rover, date: currentDate) { self.toFilterMarsPhotos() }
                DispatchQueue.main.async { [weak self] in
                    self?.marsView.tableView.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundOne
        view = marsView
        view.addSubview(archiveButton)
        navigationController?.isNavigationBarHidden = true
        marsView.tableView.tableView.delegate = self
        marsView.tableView.tableView.dataSource = self
        marsView.tableView.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        setupDateView()
        setupButtons()
        setupOverlay()
        showPreloader()
        fetchRoverNames()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        archiveButton.frame = CGRect(x: view.frame.size.width - 100,
                                     y: view.frame.size.height - 100,
                                     width: 70,
                                     height: 70)
    }
    
    private func setupDateView() {
        marsView.dateLabel.text = CustomDateFormatter.formatToDateForView(currentDate)
    }
    
    private func showPreloader() {
        let preloaderVC = PreloaderViewController()
        preloaderVC.modalPresentationStyle = .overFullScreen
        preloaderVC.modalTransitionStyle = .crossDissolve
        present(preloaderVC, animated: true, completion: nil)
    }
    
    private func hidePreloader() {
        dismiss(animated: true, completion: nil)
    }
    
    private func fetchRoverNames() {
        NetworkService.shared.getMarsRovers { result in
            switch result {
            case .success(let roversData):
                DispatchQueue.main.async { [weak self] in
                    self?.roversData = roversData
                    self?.hidePreloader()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchMarsRoverPhotos(rovers: MarsRover, date: String, completion: @escaping () -> ()) {
        NetworkService.shared.getMarsRoverPhotos(date: date, roversAll: rovers) { result in
            switch result {
            case .success(let roverPhotosData):
                DispatchQueue.main.async { [weak self] in
                    self?.roverPhotosDataArray.removeAll()
                    self?.roverPhotosDataArray.append(contentsOf: roverPhotosData)
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func toFilterMarsPhotos() {
        DispatchQueue.main.async { [weak self] in
            guard let allPhotos = self?.roverPhotosDataArray else { return }
            self?.filteredMarsPhotos = self?.filters.filterMarsPhotos(dataToFilter: allPhotos) ?? []
            self?.marsView.tableView.tableView.reloadData()
        }
    }
    
    
    private func setupOverlay() {
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.frame = view.bounds
        overlayView.alpha = 0
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(overlayView)
    }
    
    private func setupButtons() {
        archiveButton.addTarget(self, action: #selector(archiveButtonTapped), for: .touchUpInside)
        marsView.calendarButton.addTarget(self, action: #selector(openDatePicker), for: .touchUpInside)
        marsView.roverFilterButton.addTarget(self, action: #selector(openRoverPicker), for: .touchUpInside)
        marsView.cameraFilterButton.addTarget(self, action: #selector(openCameraPicker), for: .touchUpInside)
        marsView.plusButton.addTarget(self, action: #selector(saveFilterButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func archiveButtonTapped() {
        let vc = HistoryViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func openDatePicker() {
        let popupVC = DatePopupViewController()
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1
        }
        popupVC.onClose = {
            UIView.animate(withDuration: 0.3) {
                self.overlayView.alpha = 0
            }
        }
        popupVC.delegate = self
        present(popupVC, animated: true, completion: nil)
    }
    
    @objc
    func openPicker(data: [String], nameOfTheView: String) {
        let popupVC = BottomPopupViewController(data: data, nameOfTheView: nameOfTheView)
        popupVC.delegate = self
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1
        }
        popupVC.onClose = {
            UIView.animate(withDuration: 0.3) {
                self.overlayView.alpha = 0
            }
        }
        present(popupVC, animated: true, completion: nil)
    }
    
    @objc
    func openRoverPicker() {
        guard let roversData = roversData?.rovers else { return }
        let roversList = roversData.map { $0.name }
        let roversListWithAll = ["All"] + (roversList)
        openPicker(data: roversListWithAll, nameOfTheView: "Rover")
    }
    
    @objc
    func openCameraPicker() {
        let camerasList = Set(roverPhotosDataArray.map { $0.camera.fullName })
        let camerasListWithAll = ["All"] + Array(camerasList)
        openPicker(data: camerasListWithAll, nameOfTheView: "Camera")
    }
    
    @objc
    func saveFilterButtonTapped() {
        AlertHelper.showSaveFilterAlert(in: self) { [weak self] in
            try! self?.realm.write {
                guard let date = self?.currentDate else { return }
                self?.filters.date = date
                guard let filters = self?.filters else { return }
                self?.realm.add(filters)
                let config = Realm.Configuration.defaultConfiguration
                if let url = config.fileURL {
                    print(url.absoluteString)
                }
            }
        }


    }
    
    
}

extension MarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredMarsPhotos.isEmpty ? roverPhotosDataArray.count : filteredMarsPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.reuseID, for: indexPath) as! InfoViewCell
        let photo: MarsRoverPhotos.Photo
        
        if filteredMarsPhotos.isEmpty {
            photo = roverPhotosDataArray[indexPath.row]
        } else {
            photo = filteredMarsPhotos[indexPath.row]
        }
        
        if let dateFormatted = CustomDateFormatter.formatToDateForView(photo.earthDate) {
            cell.configure(rover: photo.rover.name,
                           camera: photo.camera.fullName,
                           date: dateFormatted,
                           imageUrl: photo.imgSrc)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailImageViewController()
        vc.imageString = filteredMarsPhotos[indexPath.row].imgSrc
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MarsViewController: SetupFiltersDelegate {
    func updateSelectedFilter(filterName: String, filterComponent: String) {
        switch filterName {
        case "rover":
            marsView.roverFilterButton.setTitle(filterComponent, for: .normal)
            filters.rover = filterComponent
            toFilterMarsPhotos()
        case "camera":
            marsView.cameraFilterButton.setTitle(filterComponent, for: .normal)
            filters.camera = filterComponent
            toFilterMarsPhotos()
        default:
            print("Ні один фільтр не був змінений (делегат)")
        }
    }
}

extension MarsViewController: ChangeDateDelegate {
    func updateDate(selectedDate: String) {
        currentDate = selectedDate
        let dateForTheView = CustomDateFormatter.formatToDateForView(selectedDate)
        DispatchQueue.main.async { [weak self] in
            self?.marsView.dateLabel.text = dateForTheView
        }
    }
}

extension MarsViewController: RealmSavedFiltersDelegate {
    func useSavedFilters(rover: String, camera: String, date: String) {
        guard let roversData = roversData else { return }
        fetchMarsRoverPhotos(rovers: roversData, date: date) { [weak self] in
            self?.filters.rover = rover
            self?.filters.camera = camera
            self?.filters.date = date
            self?.toFilterMarsPhotos()
        }
    }
}

//#Preview {
//    MarsViewController()
//}
