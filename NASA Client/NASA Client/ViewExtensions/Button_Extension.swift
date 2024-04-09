//
//  Button_Extension.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

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
        heightAnchor.constraint(equalToConstant: 38).isActive = true
        widthAnchor.constraint(equalToConstant: title.isEmpty ? 38 : 140).isActive = true
    }
    
    static func floatingButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 35
        button.backgroundColor = .accentOne
        button.setImage(.archive, for: .normal)
        return button
    }

    
}
