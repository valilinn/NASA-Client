//
//  InfoViewCell.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit
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
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        containerView.addSubview(marsImageView)
        
        marsImageView.snp.makeConstraints {
            $0.trailing.equalTo(containerView.snp.trailing).offset(-8)
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.width.height.equalTo(130)
        }
    
        let stack = UIStackView(arrangedSubviews: [roverLabel, cameraLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        
        containerView.addSubview(stack)
        
        stack.snp.makeConstraints {
            $0.centerY.equalTo(marsImageView.snp.centerY)
            $0.leading.equalTo(containerView.snp.leading).offset(16)
            $0.trailing.equalTo(marsImageView.snp.leading).offset(-8)
        }
    }
}

