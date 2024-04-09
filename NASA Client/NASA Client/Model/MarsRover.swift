//
//  MarsRover.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

struct MarsRover: Codable {
    let rovers: [Rover]
    
    struct Rover: Codable {
        let id: Int
        let name, landingDate, launchDate, status: String
        let maxSol: Int
        let maxDate: String
        let totalPhotos: Int
        let cameras: [Camera]
    }
    
    struct Camera: Codable {
        let name, fullName: String
        
        
    }
}


