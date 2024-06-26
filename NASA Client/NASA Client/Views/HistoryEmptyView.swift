//
//  HistoryEmptyView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 11/04/2024.
//

import UIKit

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
        title.textColor = .layerTwo
        
        imageView.image = .historyEmpty
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setConstraints() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        containerView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 145),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        containerView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        ])
    }
}
