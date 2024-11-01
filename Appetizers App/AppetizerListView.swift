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
        NavigationView {
            List(appetizerModel.appetizers) { appetizer in
                AppetizerItem(appetizer: appetizer)
            }
            .navigationTitle("Appetizer 🍱")
        }
        .onAppear {
            appetizerModel.getAppitizers()
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
            AsyncImage(url: URL(string: appetizer.imageURL)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                default:
                    ProgressView()
                }
            }
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
