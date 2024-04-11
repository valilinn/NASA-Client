//
//  Filters.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation
import RealmSwift

class Filters: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var date = CustomDateFormatter.getCurrentDate()
    @Persisted var rover = "All"
    @Persisted var camera = "All"
    private let defaultValue = "All"
    
    func filterMarsPhotos(dataToFilter: [MarsRoverPhotos.Photo]) -> [MarsRoverPhotos.Photo] {
        var filteredArray = dataToFilter
           
           if rover != defaultValue && camera != defaultValue {
               print("HAVE Filters for both rover and camera")
               filteredArray = dataToFilter.filter { $0.rover.name == self.rover && $0.camera.fullName == self.camera }
           } else if rover != defaultValue {
               print("Filters for rover")
               filteredArray = dataToFilter.filter { $0.rover.name == self.rover }
           } else if camera != defaultValue {
               print("Filters for camera")
               filteredArray = dataToFilter.filter { $0.camera.fullName == self.camera }
           } else {
               print("NO FILTERS")
           }
           
        print("FILTERED ARRAY: \(filteredArray.map {$0.earthDate})")
           return filteredArray
    }
    
    func changeFiltersToDefault() {
        rover = defaultValue
        camera = defaultValue
    }
}
