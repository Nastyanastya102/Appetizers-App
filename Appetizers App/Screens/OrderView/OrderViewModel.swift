//
//  OrderViewModel.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-04.
//

import Foundation
final class OrderViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = MockData.mockAppetizers
}
