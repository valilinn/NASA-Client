//
//  UIImageView_Extension.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 11/04/2024.
//

import UIKit

extension UIImageView {
    func loadImage(withUrl imageUrl: String) {
        if imageUrl.prefix(5) == "http:" {
            let droppedUrl = String(imageUrl.dropFirst(4))
            let url = URL(string:"https\(droppedUrl)")
            self.kf.setImage(with: url)
        } else {
            let url = URL(string: imageUrl)
            self.kf.setImage(with: url)
        }
    }
}
