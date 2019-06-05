//
//  ApiService.swift
//  CatFact-SwiftUI
//
//  Created by joe cherry on 6/4/19.
//  Copyright © 2019 joe cherry. All rights reserved.
//

import Foundation

public enum ApiError: Error {
    case response(Error)
    case decoding
    case unknown
}

class ApiService {
    private let request = URLRequest(url: URL(string: "https://cat-fact.herokuapp.com/facts/random")!)
    
    func getRandomFact(completionHandler: @escaping (Result<CatFact, ApiError>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.response(error)))
            }
            
            do {
                guard let data = data else {
                    completionHandler(.failure(.unknown))
                    return
                }
                let catFact = try JSONDecoder().decode(CatFact.self, from: data)
                completionHandler(.success(catFact))
            } catch {
                completionHandler(.failure(.decoding))
            }
        }
        
        task.resume()
    }
}
