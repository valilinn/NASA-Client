//
//  RealmSavedFiltersDelegate.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import Foundation

protocol RealmSavedFiltersDelegate: AnyObject {
    func useSavedFilters(rover: String, camera: String, date: String)
}
