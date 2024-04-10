//
//  CameraPopupViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit
import SnapKit

class BottomPopupViewController: UIViewController {
    
    let contentView = UIView()
    let pickerView = UIPickerView()
    var onClose: (() -> Void)?
    private let doneButton = UIButton()
    private let closeButton = UIButton()
    private let nameLabel = UILabel()
    weak var delegate: SetupFiltersDelegate?
    private var selectedFilter = "All"
    
    var data: [String] //["All", "Элемент 1", "Элемент 2", "Элемент 3"]
    var nameOfTheView: String
    
    init(data: [String], nameOfTheView: String) {
        self.data = data
        self.nameOfTheView = nameOfTheView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameOfTheView
        pickerView.dataSource = self
        pickerView.delegate = self
        setupViews()
        setupButtons()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .backgroundOne
        contentView.layer.cornerRadius = 48
        
//        nameLabel.text = "Name" //UILabel(text: "Name", fontType: .title2)
        nameLabel.font = CustomFont.title2
        
        doneButton.setImage(.done, for: .normal)
        doneButton.tintColor = .accentOne
        
        closeButton.setImage(.close, for: .normal)
        closeButton.tintColor = .layerTwo
    }
    
    private func setupButtons() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func closeButtonTapped() {
        dismiss(animated: true)
        self.onClose?()
    }
    
    @objc
    func doneButtonTapped() {
        dismiss(animated: true)
        self.onClose?()
        guard let name = nameLabel.text?.lowercased() else { return }
        delegate?.updateSelectedFilter(filterName: name, filterComponent: selectedFilter)
        print("Вибраний фільтр: \(name). Вибране значення: \(selectedFilter)")
    }
    
    private func setupConstraints() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(26)
            $0.height.equalTo(316)
        }
        
        contentView.addSubview(pickerView)
        pickerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(43)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(closeButton.snp.centerY)
        }
        
        contentView.addSubview(doneButton)
        doneButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
}

extension BottomPopupViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
//        delegate?.updateSelectedFilter(filterName: nameLabel.text ?? "", filterComponent: data[component])
//            print("Выбранное значение: \(data[component])")
        print(row)
        if row != nil {
            selectedFilter = data[row]
        } else {
            selectedFilter = data[0]
        }
    }
    
}


//#Preview {
//    CameraPopupViewController()
//}
