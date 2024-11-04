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
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppitizers() {
        isLoading = true
        NetworkManagerAPI.shared.getAppetizers {[self] result in
            DispatchQueue.main.async {
                self.isLoading = false
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
