//
//  AppetizerListView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizer: [Appetizer] = []
    @StateObject var appetizerModel = AppetizerViewModel()
   
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerModel.appetizers) { appetizer in
                    AppetizerItem(appetizer: appetizer)
                }
                .navigationTitle("Appetizer 🍱")
            }
            .onAppear {
                appetizerModel.getAppitizers()
            }
            if appetizerModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $appetizerModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}

struct AppetizerItem: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 6) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
            .frame(width: 60, height: 60)
            .clipShape(.rect(cornerRadius: 12))
            VStack (alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.gray)
            }.padding(.leading)
        }
    } 
}
