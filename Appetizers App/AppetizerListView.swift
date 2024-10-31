//
//  AppetizerListView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.mockAppetizers) { appetizer in
                AppetizerItem(appetizer: appetizer)
                
            }
            Text("AppetizarList")
                .navigationTitle("Appetizer 🍱")
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
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/2228553/pexels-photo-2228553.jpeg?auto=compress&cs=tinysrgb&w=60&h=60&dpr=2")) { phase in
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
