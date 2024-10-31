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
    let category: Int
    let carbs: Int
    let calories: Int
    let protein: Int
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1, name: "Mozzarella Sticks", price: 5.99, imageURL: "https://example.com/images/mozzarella_sticks.jpg", category: 1, carbs: 35, calories: 450, protein: 14)
    
    static var mockAppetizers: [Appetizer] = [
        Appetizer(id: 1, name: "Mozzarella Sticks", price: 5.99, imageURL: "https://example.com/images/mozzarella_sticks.jpg", category: 1, carbs: 35, calories: 450, protein: 14),
        Appetizer(id: 2, name: "Buffalo Wings", price: 8.49, imageURL: "https://example.com/images/buffalo_wings.jpg", category: 2, carbs: 5, calories: 600, protein: 25),
        Appetizer(id: 3, name: "Spinach Artichoke Dip", price: 7.29, imageURL: "https://example.com/images/spinach_artichoke_dip.jpg", category: 3, carbs: 15, calories: 500, protein: 10),
        Appetizer(id: 4, name: "Chicken Tenders", price: 6.99, imageURL: "https://example.com/images/chicken_tenders.jpg", category: 4, carbs: 20, calories: 550, protein: 22),
        Appetizer(id: 5, name: "Loaded Nachos", price: 9.99, imageURL: "https://example.com/images/loaded_nachos.jpg", category: 5, carbs: 60, calories: 700, protein: 20)
    ]
}
