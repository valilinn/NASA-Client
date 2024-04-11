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
        //to delete
        setViews()
        setConstraints()
        
        
        //to delete
        configure(rover: "Test", camera: "Test Test Test Test Test Test Test Test Test Test", date: "Test Test Test")
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
        
        roverLabel.text = "Curiosity" //= UILabel(text: "Curiosity", fontType: .body2)
        roverLabel.font = CustomFont.body2
        roverLabel.numberOfLines = 2
        
        cameraLabel.text = "Front Hazard Avoidance Camera" //= UILabel(text: "Front Hazard Avoidance Camera", fontType: .body2)
        cameraLabel.font = CustomFont.body2
        cameraLabel.numberOfLines = 2
        
        dateLabel.text = "June 6, 2019" //= UILabel(text: "June 6, 2019", fontType: .body2)
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
        
        containerView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        containerView.addSubview(filtersLabel)
        filtersLabel.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.top).offset(12)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-8)
        }
        
        containerView.addSubview(lineImageView)
        lineImageView.snp.makeConstraints {
            $0.leading.equalTo(containerView.snp.leading).offset(8)
            $0.centerY.equalTo(filtersLabel.snp.centerY)
            $0.trailing.equalTo(filtersLabel.snp.leading)
        }
        
        let stack = UIStackView(arrangedSubviews: [roverLabel, cameraLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        
        containerView.addSubview(stack)
        stack.snp.makeConstraints {
            $0.top.equalTo(lineImageView.snp.bottom).offset(16)
            $0.leading.equalTo(containerView.snp.leading).offset(16)
            $0.trailing.equalTo(containerView.snp.trailing).offset(-16)
        }
        
    }
}

//#Preview {
//    HistoryViewCell()
//}
