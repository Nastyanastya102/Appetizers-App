//
//  Appetizer.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-30.
//

import Foundation

struct ResponceData: Decodable {
    let request: [Appetizer]
}

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: String
    let carbs: Int
    let calories: Int
    let protein: Int
    let description: String
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1, name: "Mozzarella Sticks", price: 5.99, imageURL: "https://example.com/images/mozzarella_sticks.jpg",  carbs: 14, calories: 35, protein: 450, description: "Some description Mozzarella")
    
    static var mockAppetizers: [Appetizer] = [Appetizer(id: 1, name: "Mozzarella Sticks", price: 5.99, imageURL: "https://example.com/images/mozzarella_sticks.jpg",  carbs: 14, calories: 35, protein: 450, description: "Some description Mozzarella"), Appetizer(id: 1, name: "Mozzarella Sticks", price: 5.99, imageURL: "https://example.com/images/mozzarella_sticks.jpg",  carbs: 14, calories: 35, protein: 450, description: "Some description Mozzarella")]
}
