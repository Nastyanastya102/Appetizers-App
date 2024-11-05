//
//  OrderViewModel.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-04.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    var total: Double { appetizers.reduce(0) { $0 + $1.price } }
    
    func add(_ item: Appetizer) {
        appetizers.append(item)
    }
    
    func delete(_ index: IndexSet) {
        appetizers.remove(atOffsets: index)
    }
}
