//
//  DetailImageView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit
import SnapKit

class DetailImageView: UIView {
    
    private let containerView = UIView()
    let imageView = UIImageView()
    let closeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(image: String) {
        let droppedUrl = String(image.dropFirst(4))
        let url = URL(string:"https\(droppedUrl)")
        imageView.kf.setImage(with: url)
    }
    
    private func setViews() {
        containerView.backgroundColor = .black
        
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "morskieOko")
        
        closeButton.setImage(.whiteCloseButton, for: .normal)
        closeButton.tintColor = .white
    }
    
    private func setConstraints() {
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalTo(containerView.snp.edges)
        }
        
        containerView.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.top).offset(70)
            $0.leading.equalTo(containerView.snp.leading).offset(16)
        }
    }
}

