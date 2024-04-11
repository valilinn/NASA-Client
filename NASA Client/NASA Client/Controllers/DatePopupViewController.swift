//
//  DatePopupViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit
import SnapKit

class DatePopupViewController: UIViewController {
    
    let contentView = UIView()
    let datePicker = UIDatePicker()
    var onClose: (() -> Void)?
    private let doneButton = UIButton()
    private let closeButton = UIButton()
    private let dateLabel = UILabel()
    weak var delegate: ChangeDateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupButtons()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .backgroundOne
        contentView.layer.cornerRadius = 48
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "en_US")
        
        dateLabel.text = "Date"
        dateLabel.font = CustomFont.title2
        
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
        delegate?.updateDate(selectedDate: CustomDateFormatter.formatDate(datePicker.date))
    }
    
    private func setupConstraints() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(312)
        }
        
        contentView.addSubview(datePicker)
        datePicker.snp.makeConstraints {
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
