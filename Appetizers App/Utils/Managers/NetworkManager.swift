//
//  NetworkManager.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-31.
//
import Foundation
import SwiftUI

final class NetworkManagerAPI {
    static let shared = NetworkManagerAPI()
    
    private var cache = NSCache<NSString, UIImage>()
    
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
    
    func downloadImage(urlString: String, completed: @escaping (UIImage?) -> Void ) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, responce, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}

