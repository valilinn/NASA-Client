//
//  CustomFont.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import UIKit

enum CustomFont {
    static let largeTitle = UIFont(name: "SFPro-Bold", size: 34) ?? .systemFont(ofSize: 34, weight: .bold)
    static let title2 = UIFont(name: "SFPro-Bold", size: 22) ?? .systemFont(ofSize: 22, weight: .bold)
    static let title = UIFont(name: "SFPro-Regular", size: 22) ?? .systemFont(ofSize: 22)
    static let body2 = UIFont(name: "SFPro-Bold", size: 17) ?? .systemFont(ofSize: 17, weight: .bold)
    static let body = UIFont(name: "SFPro-Regular", size: 16) ?? .systemFont(ofSize: 16)
}
