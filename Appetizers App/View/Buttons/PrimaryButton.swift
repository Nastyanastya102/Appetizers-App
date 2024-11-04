//
//  PrimaryButton.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//

import SwiftUI

struct PrimaryButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .font(.title2)
            .bold()
            .frame(width: 260, height: 50)
            .background(Color.BrandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    PrimaryButton(title: "Press")
}
