//
//  NSAttributedString_Extension.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit

extension NSMutableAttributedString {
    static func formattedString(prefix: String, value: String, textColor: UIColor, prefixLength: Int) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: CustomFont.body,
            .foregroundColor: textColor
        ]
        let attributedString = NSMutableAttributedString(string: "\(prefix) \(value)", attributes: attributes)
        attributedString.addAttribute(.foregroundColor, value: UIColor.layerTwo, range: NSRange(location: 0, length: prefixLength))
        return attributedString
    }
}

