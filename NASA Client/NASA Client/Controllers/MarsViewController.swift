//
//  MarsViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit

class MarsViewController: UIViewController {
    
    private let marsView = MarsView()
    private var archiveButton = UIButton.floatingButton()
    private let cellHeight: CGFloat = 162
    private let spacingBetweenCells: CGFloat = 15
    private let overlayView = UIView()
    
    //test count row
    var data: CGFloat = 5
    
    //to get all rovers
    var roversData: MarsRover? {
        didSet {
            if let rover = roversData {
                fetchMarsRoverPhotos(rovers: rover)
            }
        }
    }
//an array of all data
    var roverPhotosDataArray = [MarsRoverPhotos.Photo]() {
        didSet {
            marsView.tableView.tableView.reloadData()
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
        marsView.tableViewHeightConstraint?.update(offset: data * cellHeight)
        marsView.tableView.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        setupButtons()
        setupOverlay()
        fetchRoverNames()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        archiveButton.frame = CGRect(x: view.frame.size.width - 100,
                                     y: view.frame.size.height - 100,
                                     width: 70,
                                     height: 70)
    }
    
    func fetchRoverNames() {
        NetworkService.shared.getMarsRovers { result in
            switch result {
            case .success(let roversData):
                DispatchQueue.main.async {
                    self.roversData = roversData
                    print(self.roversData?.rovers.map {$0.name})
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchMarsRoverPhotos(rovers: MarsRover) {
        NetworkService.shared.getMarsRoverPhotos(date: "2015-12-3", roversAll: rovers) { result in
            switch result {
            case .success(let roverPhotosData):
                DispatchQueue.main.async {
                    self.roverPhotosDataArray.append(contentsOf: roverPhotosData.photos)
//                    print(self.roverPhotosDataArray)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
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
        marsView.plusButton.addTarget(self, action: #selector(saveFilterButton), for: .touchUpInside)
    }
    
    @objc
    func archiveButtonTapped() {
        navigationController?.pushViewController(HistoryViewController(), animated: true)
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
        present(popupVC, animated: true, completion: nil)
    }
    
    @objc
    func openPicker(data: [String], nameOfTheView: String) {
        let popupVC = CameraPopupViewController(data: data, nameOfTheView: nameOfTheView)
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
    func openCameraPicker() {
        openPicker(data: ["All", "Элемент 1", "Элемент 2", "Элемент 3"], nameOfTheView: "Camera")
    }
    
    @objc
    func openRoverPicker() {
        openPicker(data: ["All", "Rover 1", "Rover 2", "Rover 3"], nameOfTheView: "Rover")
    }
    
    @objc
    func saveFilterButton() {
        
    }
    
}

extension MarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        roverPhotosDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.reuseID, for: indexPath) as! InfoViewCell
        
        cell.configure(rover: roverPhotosDataArray[indexPath.row].rover.name, camera: roverPhotosDataArray[indexPath.row].camera.fullName, date: roverPhotosDataArray[indexPath.row].earthDate, imageUrl: roverPhotosDataArray[indexPath.row].imgSrc)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailImageViewController()
        vc.imageString = roverPhotosDataArray[indexPath.row].imgSrc
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
//#Preview {
//    MarsViewController()
//}
