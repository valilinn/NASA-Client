//
//  PreloaderView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import Foundation
import UIKit
import Lottie

class PreloaderView: UIView {
    private let containerView = UIView()
    private let imageView = UIImageView()
    var animationView: LottieAnimationView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLottie()
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLottie() {
        animationView = .init(name: "loader")
        animationView!.frame = self.bounds
        animationView!.contentMode = .scaleAspectFill
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        animationView!.play()
    }
    
    private func setViews() {
        containerView.backgroundColor = .backgroundOne
        imageView.image = .preloaderIcon
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
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        if let animationView = animationView {
            containerView.addSubview(animationView)
            animationView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                animationView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                animationView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50),
                animationView.heightAnchor.constraint(equalToConstant: 102),
                animationView.widthAnchor.constraint(equalToConstant: 333)
            ])
        }
    }
}
