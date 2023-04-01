//
//  login.swift
//  workspace
//
//  Created by Vlad on 31.03.2023.
//

import Foundation

func login(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    guard let url = URL(string: "http://127.0.0.1:5000/login") else {
        completion(.failure(NSError(domain: "http://127.0.0.1:5000", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let parameters: [String: Any] = [
        "username": username,
        "password": password
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data, let response = response as? HTTPURLResponse else {
            completion(.failure(NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid server response"])))
            return
        }
        
        if response.statusCode == 200 {
            completion(.success(true))
        } else {
            completion(.success(false))
        }
    }.resume()
}

