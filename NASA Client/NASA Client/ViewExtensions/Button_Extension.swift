//
//  Button_Extension.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import Foundation

import UIKit

extension UIButton {
    
    convenience init(title: String = "", image: UIImage) {
        self.init(type: .system)
        backgroundColor = .backgroundOne
        layer.cornerRadius = 10
        setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        setTitle(title, for: .normal)
        imageView?.tintColor = .layerTwo
        titleLabel?.font = UIFont(name: "SFPro-Bold", size: 17)
        titleLabel?.textAlignment = .left
        tintColor = .black
      
//        contentEdgeInsets = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
//        imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
       
        heightAnchor.constraint(equalToConstant: 38).isActive = true
        widthAnchor.constraint(equalToConstant: title.isEmpty ? 38 : 140).isActive = true
    }
    
}
