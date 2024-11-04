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
    var appetizer: Appetizer
    @Binding var isShowingView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 340, height: 225)
                .aspectRatio(contentMode: .fit)
            Text(appetizer.name)
                .font(.title)
                .bold()
                .padding(8)
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
                PrimaryButton(title: "\(appetizer.price, specifier: "%.2f")$ - Add to Oder")
            }
            .padding(.bottom, 30)
            Spacer()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingView = false
            } label: {
                CloseButton()
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
