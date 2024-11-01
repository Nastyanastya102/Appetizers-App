//
//  AppetizerViewModel.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-31.
//

import Foundation

final class AppetizerViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppitizers() {
        NetworkManagerAPI.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let appt):
                    self.appetizers = appt
                   break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
