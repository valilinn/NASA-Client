//
//  Filters.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

struct Filters {
//    var date = CurrentDate().date
    var rover = ""
    var camera = ""
    
    func filterMarsPhotos(dataToFilter: [MarsRoverPhotos.Photo]) -> [MarsRoverPhotos.Photo] {
        var filteredArray = dataToFilter
        
        if !rover.isEmpty && !camera.isEmpty {
            print("HAVE FILTERS for both rover and camera")
            filteredArray = dataToFilter.filter { $0.rover.name == self.rover && $0.camera.fullName == self.camera }
        } else if !rover.isEmpty {
            print("HAVE FILTERS for rover")
            filteredArray = dataToFilter.filter { $0.rover.name == self.rover }
        } else if !camera.isEmpty {
            print("HAVE FILTERS for camera")
            filteredArray = dataToFilter.filter { $0.camera.fullName == self.camera }
        } else {
            print("NO FILTERS")
        }
        
        print(filteredArray)
        return filteredArray
    }
}
