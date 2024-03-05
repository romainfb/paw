//
//  ApiManager.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 02/03/2024.
//

import Foundation


struct APIManager {
    static let shared = APIManager() // Utilisation d'un singleton pour partager la même instance dans toute l'application

    private init() {}

    func performPOSTRequest<T: Encodable>(urlString: String, data: T, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(data)
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    // Ajoutez d'autres cas d'erreur au besoin
}
