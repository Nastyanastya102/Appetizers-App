//
//  Appetizers_AppApp.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

@main
struct Appetizers_AppApp: App {
    var orders = Order()
    var body: some Scene {
        WindowGroup {
            AppetizaeTabView().environmentObject(orders)
        }
    }
}
