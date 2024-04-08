//
//  UILabel_Extension.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit

enum SFFonts {
    case largeTitle
    case title2
    case title
    case body2
    case body
}

extension UILabel {
    convenience init(text: String = "", fontType: SFFonts) {
        self.init()
        self.text = text
        switch fontType {
        case .largeTitle:
            self.font = UIFont(name: "SFPro-Bold", size: 34)
            self.textAlignment = .left
            heightAnchor.constraint(equalToConstant: 41).isActive = true
        case .title2:
            self.font = UIFont(name: "SFPro-Bold", size: 22)
            self.textAlignment = .left
            heightAnchor.constraint(equalToConstant: 28).isActive = true
        case .title:
            self.font = UIFont(name: "SFPro-Regular", size: 22)
            self.textAlignment = .left
            heightAnchor.constraint(equalToConstant: 28).isActive = true
        case .body2:
            self.font = UIFont(name: "SFPro-Bold", size: 17)
            self.textAlignment = .left
            heightAnchor.constraint(equalToConstant: 22).isActive = true
        case .body:
            self.font = UIFont(name: "SFPro-Regular", size: 16)
            self.textAlignment = .left
            heightAnchor.constraint(equalToConstant: 21).isActive = true
        }
    }
}
