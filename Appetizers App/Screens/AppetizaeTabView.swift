//
//  ContentView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct AppetizaeTabView: View {
    @EnvironmentObject var orders: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Order")
                }
                .badge(orders.appetizers.count)
        }
        .accentColor(.BrandPrimary)
        
    }
    
    
}

#Preview {
    AppetizaeTabView()
}
