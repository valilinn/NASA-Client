//
//  CameraPopupViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit
import SnapKit

class CameraPopupViewController: UIViewController {
    
    let contentView = UIView()
    let pickerView = UIPickerView()
    var onClose: (() -> Void)?
    private let doneButton = UIButton()
    private let closeButton = UIButton()
    private let dateLabel = UILabel(text: "Camera", fontType: .title2)
    
    var data: [String] = ["All", "Элемент 1", "Элемент 2", "Элемент 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        setupViews()
        setupButtons()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .backgroundOne
        contentView.layer.cornerRadius = 48
        
        doneButton.setImage(.done, for: .normal)
        doneButton.tintColor = .accentOne
        
        closeButton.setImage(.close, for: .normal)
        closeButton.tintColor = .layerTwo
    }
    
    private func setupButtons() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func closeButtonTapped() {
        dismiss(animated: true)
        self.onClose?()
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
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
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

extension CameraPopupViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
        // добавить код для обработки выбранного элемента здесь
    }
    
    
}

#Preview {
    CameraPopupViewController()
}
