//
//  NetworkRequest.swift
//  Kinopoisk
//
//  Created by Алена on 14.04.2024.
//

import UIKit

class NetworkRequest {
    
    let apiKey = "2265085d-d05b-4110-8a59-af59e968c0f4"
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestDataFetch(urlString: String, completion: @escaping (Result<Data, Error>) -> ()) {
        
        guard let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlEncoded) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
