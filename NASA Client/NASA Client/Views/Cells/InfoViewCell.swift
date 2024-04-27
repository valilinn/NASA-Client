//
//  InfoViewCell.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import Kingfisher

class InfoViewCell: UITableViewCell {
    
    static let reuseID = "InfoCell"
    
    private let containerView = UIView()
    private let roverLabel = UILabel()
    private let cameraLabel = UILabel()
    private let dateLabel = UILabel()
    private let marsImageView = UIImageView()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(rover: String, camera: String, date: String, imageUrl: String) {
        roverLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Rover:", value: rover, textColor: UIColor.layerOne, prefixLength: 6)
        cameraLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Camera:", value: camera, textColor: UIColor.layerOne, prefixLength: 7)
        dateLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Date:", value: date, textColor: UIColor.layerOne, prefixLength: 5)
        marsImageView.loadImage(withUrl: imageUrl)
        
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
        cameraLabel.numberOfLines = 2
        
        dateLabel.text = "June 6, 2019"
        dateLabel.font = CustomFont.body2
        dateLabel.numberOfLines = 2
        
        marsImageView.image = .mars
        marsImageView.contentMode = .scaleAspectFill
        marsImageView.layer.cornerRadius = 20
        marsImageView.layer.masksToBounds = true
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
        
        containerView.addSubview(marsImageView)
        marsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            marsImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            marsImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            marsImageView.widthAnchor.constraint(equalToConstant: 130),
            marsImageView.heightAnchor.constraint(equalTo: marsImageView.widthAnchor)
        ])
        
        let stack = UIStackView(arrangedSubviews: [roverLabel, cameraLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: marsImageView.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: marsImageView.leadingAnchor, constant: -8)
        ])
    }
}

