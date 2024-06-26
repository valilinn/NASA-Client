//
//  NetworkService.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService(); private init() { }
    private let server = "api.nasa.gov"
    private let session = URLSession.shared
    private let apiKey = "RUSxd183cDyDVTWfpzacoeG71pT7VpJltKxp7Xkw"
    
    private enum Gateway: String {
        case http = "http://"
        case https = "https://"
    }
    
    private enum EndPoint: String {
        case allRovers = "/mars-photos/api/v1/rovers/"
        case currentRoverData = "/photos"
    }
    
    func getMarsRovers(completion: @escaping (Result<MarsRover, Error>) -> ()) {
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
    
    func getMarsRoverPhotos(date: String, roversAll: MarsRover, completion: @escaping (Result<[MarsRoverPhotos.Photo], Error>) -> ()) {
        var allPhotos: [MarsRoverPhotos.Photo] = []
        let dispatchGroup = DispatchGroup()
        
        for rover in roversAll.rovers {
            dispatchGroup.enter()
            
            var urlStr = Gateway.https.rawValue + server + EndPoint.allRovers.rawValue + rover.name.lowercased() + EndPoint.currentRoverData.rawValue
            urlStr += "?earth_date=\(date)&api_key=\(apiKey)"
            
            guard let url = URL(string: urlStr) else {
                dispatchGroup.leave()
                return
            }
            
            print(url)
            let task = session.dataTask(with: url) { data, response, error in
                defer {
                    dispatchGroup.leave() 
                }
                
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    }
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let marsRoverPhotosData = try decoder.decode(MarsRoverPhotos.self, from: data)
                    allPhotos.append(contentsOf: marsRoverPhotosData.photos)
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(.success(allPhotos))
        }
    }
}
