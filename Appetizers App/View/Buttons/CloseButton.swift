//
//  CloseButton.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
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

#Preview {
    CloseButton()
}
