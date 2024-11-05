//
//  AppetizerListView.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-10-29.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var appetizerModel = AppetizerViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerModel.appetizers) { appetizer in
                    AppetizerItem(appetizer: appetizer)
                        .onTapGesture {
                            appetizerModel.isShowingDetail = true
                            appetizerModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("Appetizer 🍱")
                .disabled(appetizerModel.isShowingDetail)
            }
            .onAppear {
                appetizerModel.getAppitizers()
            }
            .blur(radius: appetizerModel.isShowingDetail ? 20 : 0)
            
            
            if appetizerModel.isShowingDetail {
                AppetizerCard(appetizer: appetizerModel.selectedAppetizer!, isShowingView: $appetizerModel.isShowingDetail)
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
