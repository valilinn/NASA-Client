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
    }
}


