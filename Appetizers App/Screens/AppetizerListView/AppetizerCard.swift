//
//  AppetizerCard.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//

import SwiftUI

struct AppetizerCard: View {
    let appetizer: Appetizer
    @Binding var isShowingView: Bool
    
    var body: some View {
        VStack {
            Card(appetizer: appetizer, isShowingView: $isShowingView)
        }
        .frame(width: 340, height: 550, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}

struct Card: View {
    let appetizer: Appetizer
    @Binding var isShowingView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(height: 225)
                .onAppear()
            Text(appetizer.name)
                .font(.title)
                .bold()
                .padding(16)
            Text(appetizer.description)
                .font(.system(size: 16, weight: .light))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            HStack(spacing: 32) {
                ItemValue(title: "Calories", value: String(appetizer.calories))
                ItemValue(title: "Protein", value: "\(appetizer.protein) g")
                ItemValue(title: "Carbs", value: "\(appetizer.carbs) g")
            }
            Spacer()
            Button {
                print("Button pressed")
            } label: {
                Text("\(appetizer.price, specifier: "%.2f")$ - Add to Oder")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
            }
            .padding()
            .foregroundColor(.white)
            .background(.brandPrimary)
            .cornerRadius(10)
            Spacer()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingView = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .frame(width: 44, height: 4)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ItemValue: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
            Text(value).italic().foregroundColor(.secondary)
        }
    }
}

#Preview {
    AppetizerCard(appetizer: MockData.sampleAppetizer, isShowingView: .constant(true))
}
