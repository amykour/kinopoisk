//
//  NetworkDataFetch.swift
//  Kinopoisk
//
//  Created by Алена on 14.04.2024.
//

import UIKit

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchMovieSearch(urlString: String, response: @escaping (MovieCellModel?, Error?) -> ()) {
        
        NetworkRequest.shared.requestDataFetch(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(MovieCellModel.self, from: data)
                    response (json, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
    
    func fetchMovie(urlString: String, response: @escaping (Movie?, Error?) -> ()) {

        NetworkRequest.shared.requestDataFetch(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(Movie.self, from: data)
                    response (json, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}
