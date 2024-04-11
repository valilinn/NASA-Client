//
//  PreloaderView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import Foundation
import UIKit
import SnapKit
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
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.centerY.equalTo(containerView.snp.centerY)
        }
        
        containerView.addSubview(animationView!)
        animationView!.snp.makeConstraints {
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.bottom.equalTo(containerView.snp.bottom).offset(-50)
            $0.height.equalTo(102)
            $0.width.equalTo(333)
        }
    }
}
