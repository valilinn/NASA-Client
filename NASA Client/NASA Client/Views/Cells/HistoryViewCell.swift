//
//  HistoryViewCell.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import UIKit
import SnapKit
import Kingfisher

class HistoryViewCell: UITableViewCell {
    
    static let reuseID = "HistoryViewCell"
    
    private let containerView = UIView()
    private let roverLabel = UILabel()
    private let cameraLabel = UILabel()
    private let dateLabel = UILabel()
    private let filtersLabel = UILabel()
    private let lineImageView = UIImageView()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(rover: String, camera: String, date: String) {
        roverLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Rover:", value: rover, textColor: UIColor.layerOne, prefixLength: 6)
        cameraLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Camera:", value: camera, textColor: UIColor.layerOne, prefixLength: 7)
        dateLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Date:", value: date, textColor: UIColor.layerOne, prefixLength: 5)
        lineImageView.image = .line
    }
  
    private func setViews() {
        containerView.backgroundColor = .backgroundOne
        containerView.layer.cornerRadius = 24
        containerView.layer.shadowColor = UIColor.layerTwo.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 8
        
        roverLabel.text = "Curiosity"
        roverLabel.font = CustomFont.body2
        roverLabel.numberOfLines = 2
        
        cameraLabel.text = "Front Hazard Avoidance Camera"
        cameraLabel.font = CustomFont.body2
        cameraLabel.numberOfLines = 1
        
        dateLabel.text = "June 6, 2019"
        dateLabel.font = CustomFont.body2
        dateLabel.numberOfLines = 2
        
        filtersLabel.text = "Filters"
        filtersLabel.font = CustomFont.title2
        filtersLabel.textColor = .accentOne
        
        lineImageView.image = .line
        lineImageView.contentMode = .scaleAspectFit
        lineImageView.layer.cornerRadius = 20
        lineImageView.layer.masksToBounds = true
    }
    
    private func setConstraints() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        containerView.addSubview(filtersLabel)
        filtersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filtersLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            filtersLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
        
        containerView.addSubview(lineImageView)
        lineImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            lineImageView.centerYAnchor.constraint(equalTo: filtersLabel.centerYAnchor),
            lineImageView.trailingAnchor.constraint(equalTo: filtersLabel.leadingAnchor)
        ])
        
        let stack = UIStackView(arrangedSubviews: [roverLabel, cameraLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: lineImageView.bottomAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
}
