//
//  OrderView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct OrderView: View {
    @StateObject var vm = OrderViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vm.appetizers) {appetizer in
                        AppetizerItem(appetizer: appetizer)
                    }
                    .onDelete(perform: { indexSet in
                        onDeleteItem(at: indexSet)
                    })
                }
                .listStyle(PlainListStyle())
                Button {
                    print("pressed")
                } label: {
                    PrimaryButton(title: "Post Order")
                }
            }
           
            .navigationTitle("Order 🧾")
        }
    }
    
    func onDeleteItem(at offset: IndexSet) {
        vm.appetizers.remove(atOffsets: offset)
    }
}

#Preview {
    OrderView()
}
