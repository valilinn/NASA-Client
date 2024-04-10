//
//  Filters.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

struct Filters {
//    var date = CurrentDate().date
    var rover = "All"
    var camera = "All"
    private let defaultValue = "All"
    
    func filterMarsPhotos(dataToFilter: [MarsRoverPhotos.Photo]) -> [MarsRoverPhotos.Photo] {
        var filteredArray = dataToFilter
           
           if rover != defaultValue && camera != defaultValue {
               print("HAVE FILTERS for both rover and camera")
               filteredArray = dataToFilter.filter { $0.rover.name == self.rover && $0.camera.fullName == self.camera }
           } else if rover != defaultValue {
               print("HAVE FILTERS for rover")
               filteredArray = dataToFilter.filter { $0.rover.name == self.rover }
           } else if camera != defaultValue {
               print("HAVE FILTERS for camera")
               filteredArray = dataToFilter.filter { $0.camera.fullName == self.camera }
           } else {
               print("NO FILTERS")
           }
           
           print("FILTERED ARRAY\(filteredArray)")
           return filteredArray
    }
}
