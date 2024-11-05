//
//  OrderView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orders: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orders.appetizers) {appetizer in
                            AppetizerItem(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            orders.delete(indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("pressed")
                    } label: {
                        PrimaryButton(title: "$\(orders.total, specifier: "%.2f") - Post Order")
                    }
                    .padding(.bottom, 25)
                }
                
                if orders.appetizers.isEmpty {
                    EmptyState()
                }
            }
            .navigationTitle("Order 🧾")
        }
    }
}

#Preview {
    OrderView()
}
