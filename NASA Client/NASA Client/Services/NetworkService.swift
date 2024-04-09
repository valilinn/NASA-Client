//
//  NetworkService.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation
//https://api.nasa.gov/mars-photos/api/v1/rovers/?api_key=DEMO_KEY
//https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=DEMO_KEY
//https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=URR7fWdZm1Um6SCIf7KS0qEcA9RH7GmLu8eglWK8

final class NetworkService {
    static let shared = NetworkService(); private init() { }
    private let server = "api.nasa.gov"
    private let session = URLSession.shared
    private let apiKey = "URR7fWdZm1Um6SCIf7KS0qEcA9RH7GmLu8eglWK8"
    
    private enum Gateway: String {
        case http = "http://"
        case https = "https://"
    }
    
    private enum EndPoint: String {
        case allRovers = "/mars-photos/api/v1/rovers/"
        case currentRoverData = "curiosity/photos"
    }
    
    func getMarsRovers(completion: @escaping (Result<MarsRover, Error>) -> ()) {
//        var urlStr = Gateway.https.rawValue + server + EndPoint.currentRoverData.rawValue
//        urlStr += "?earth_date=\(date)&api_key=\(apiKey)"
        var urlStr = Gateway.https.rawValue + server + EndPoint.allRovers.rawValue
        urlStr += "?api_key=\(apiKey)"
        
        guard let url = URL(string: urlStr) else { return }
        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let marsRoversData = try decoder.decode(MarsRover.self, from: data)
                completion(.success(marsRoversData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getMarsRoverPhotos(date: String, completion: @escaping (Result<MarsRoverPhotos, Error>) -> ()) {
        var urlStr = Gateway.https.rawValue + server + EndPoint.allRovers.rawValue + EndPoint.currentRoverData.rawValue
        urlStr += "?earth_date=\(date)&api_key=\(apiKey)"
        
        guard let url = URL(string: urlStr) else { return }
        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let marsRoverPhotosData = try decoder.decode(MarsRoverPhotos.self, from: data)
                completion(.success(marsRoverPhotosData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
