//
//  EmptyState.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-04.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            VStack {
                Image("empty-state")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, alignment: .center)
                Text("You have no orders")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
  
    }
}

#Preview {
    EmptyState()
}
