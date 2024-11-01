//
//  AppetizerViewModel.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-31.
//

import Foundation

final class AppetizerViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    func getAppitizers() {
        NetworkManagerAPI.shared.getAppetizers {[self] result in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let appt):
                    self.appetizers = appt
                   break
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        break
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        break
                    case .invalidResponce:
                        self.alertItem = AlertContext.invalidResponse
                        break
                    case .unableToCompleteRequest:
                        self.alertItem = AlertContext.unableToCompleteRequest
                        break
                    }
                }
            }
        }
    }
}
