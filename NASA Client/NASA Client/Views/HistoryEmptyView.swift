//
//  HistoryEmptyView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 11/04/2024.
//

import UIKit
import SnapKit

class HistoryEmptyView: UIView {
    
    private let containerView = UIView()
    private let title = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundOne
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        title.text = "Browsing history is empty."
        title.font = CustomFont.body
        
        imageView.image = .historyEmpty
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setConstraints() {
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerY.equalTo(containerView.snp.centerY)
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.height.width.equalTo(145)
        }
        
        containerView.addSubview(title)
        title.snp.makeConstraints {
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.top.equalTo(imageView.snp.bottom).offset(16)
        }
    }
}
