//
//  SetupFiltersDelegate.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import Foundation

protocol SetupFiltersDelegate: AnyObject {
    func updateSelectedFilter(filterName: String, filterComponent: String)
}
