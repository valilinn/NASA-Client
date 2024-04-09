//
//  MarsRoverPhotos.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

struct MarsRoverPhotos: Codable {
    let photos: [Photo]
    
    struct Photo: Codable {
        let id, sol: Int
        let camera: PhotoCamera
        let imgSrc: String
        let earthDate: String
        let rover: Rover
    }
    
    struct PhotoCamera: Codable {
        let id: Int
        let name: String
        let roverId: Int
        let fullName: String
    }
    
    struct Rover: Codable {
        let id: Int
        let name, landingDate, launchDate, status: String
        let maxSol: Int
        let maxDate: String
        let totalPhotos: Int
        let cameras: [CameraElement]
    }
    
    struct CameraElement: Codable {
        let name, fullName: String
    }
}





