//
//  Alert.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-31.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(
        title: Text("Invalid URL"),
        message: Text("Wrong URL format"),
        dismissButton: .default(Text("OK"))
    )
   
    static let invalidResponse = AlertItem(
        title: Text("Invalid response"),
        message: Text("Something went wrong. Please contact support"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidData = AlertItem(
        title: Text("Invalid data"),
        message: Text("Something went wrong. Please contact support"),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToCompleteRequest = AlertItem(
        title: Text("Unable to complete request"),
        message: Text("Something went wrong. Please check your internet connection"),
        dismissButton: .default(Text("OK"))
    )
    
}
