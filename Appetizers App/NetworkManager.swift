//
//  NetworkManager.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-31.
//
import Foundation

final class NetworkManagerAPI {
    static let shared = NetworkManagerAPI()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let appetizerUrl = baseUrl + "/appetizers"
    private init() {}
    
    func getAppetizers(completion: @escaping (Result<[Appetizer], ApError>) -> Void) {

        guard let url = URL(string: appetizerUrl) else {
            completion(.failure(.invalidURL))
            return
        }
 
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, responce, error in
            if let _ = error {
                completion(.failure(.unableToCompleteRequest))
                return
            }
            
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                completion(.failure(.invalidResponce))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(ResponceData.self, from: data)
                completion(.success(decoded.request))
            } catch {
                completion(.failure(.invalidData))
            }
        }

        task.resume()

    }
}

