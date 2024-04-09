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
//    private let roverLabel = UILabel(text: "Rover:", fontType: .body)
    private let roverLabel = UILabel(text: "Curiosity", fontType: .body2)
//    private let cameraLabel = UILabel(text: "Camera:", fontType: .body)
    private let cameraLabel = UILabel(text: "Front Hazard Avoidance Camera", fontType: .body2)
//    private let dateLabel = UILabel(text: "Date:", fontType: .body)
    private let dateLabel = UILabel(text: "June 6, 2019", fontType: .body2)
    private let marsImageView = UIImageView()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //to delete
//        configure(rover: "Test", camera: "Test Test Test Test Test Test Test Test Test Test", date: "Test Test Test ", imageUrl: <#String#>)
        setViews()
        setConstraints()
        //to delete
       
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(rover: String, camera: String, date: String, imageUrl: String) {
        roverLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Rover:", value: rover, textColor: UIColor.layerOne, prefixLength: 6)
        cameraLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Camera:", value: camera, textColor: UIColor.layerOne, prefixLength: 7)
        dateLabel.attributedText = NSMutableAttributedString.formattedString(prefix: "Date:", value: date, textColor: UIColor.layerOne, prefixLength: 5)
        
        let droppedUrl = String(imageUrl.dropFirst(4))
        let url = URL(string:"https\(droppedUrl)")
        marsImageView.kf.setImage(with: url)
        
    }
  
    private func setViews() {
        containerView.backgroundColor = .backgroundOne
        containerView.layer.cornerRadius = 24
        containerView.layer.shadowColor = UIColor.layerTwo.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 8
        
        roverLabel.numberOfLines = 2
        cameraLabel.numberOfLines = 2
//        cameraLabel.lineBreakMode = .byWordWrapping
        dateLabel.numberOfLines = 2
        
        marsImageView.image = .mars
        marsImageView.contentMode = .scaleAspectFill
        marsImageView.layer.cornerRadius = 20
        marsImageView.layer.masksToBounds = true
    }
    
    private func setConstraints() {
        addSubview(containerView)
        
        containerView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
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
        
//        containerView.addSubview(roverLabel)
//        roverLabel.snp.makeConstraints {
//            $0.top.equalTo(containerView.snp.top).offset(16)
//            $0.leading.equalTo(containerView.snp.leading).offset(16)
//            $0.trailing.equalTo(marsImageView.snp.leading).offset(-16)
//        }
//        
//        containerView.addSubview(cameraLabel)
//        cameraLabel.snp.makeConstraints {
//            $0.top.equalTo(roverLabel.snp.bottom).offset(16)
//            $0.leading.equalTo(roverLabel.snp.leading)
//            $0.trailing.equalTo(marsImageView.snp.leading).offset(-16)
//            
//        }
//        
//        containerView.addSubview(dateLabel)
//        dateLabel.snp.makeConstraints {
//            $0.top.equalTo(cameraLabel.snp.bottom).offset(16)
//            $0.leading.equalTo(cameraLabel.snp.leading)
//            $0.trailing.equalTo(marsImageView.snp.leading).offset(-16)
//        }
        
        
        let stack = UIStackView(arrangedSubviews: [roverLabel, cameraLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        
        
        containerView.addSubview(stack)
        
        
        stack.snp.makeConstraints {
//            $0.top.equalTo(containerView.snp.top).offset(16)
            $0.centerY.equalTo(marsImageView.snp.centerY)
            $0.leading.equalTo(containerView.snp.leading).offset(16)
            $0.trailing.equalTo(marsImageView.snp.leading).offset(-16)
        }
    }
}

//#Preview {
//    InfoViewCell()
//}
