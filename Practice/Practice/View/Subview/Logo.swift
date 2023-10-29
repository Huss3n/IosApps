//
//  Logo.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("chatApp")
                .resizable()
                .scaledToFit()
                .overlay(
                    LinearGradient(colors: [.red, .blue.opacity(0.4), .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(color: .black, radius: 3)
            
            Text("Chatty")
                .font(.headline)
                .fontWeight(.black)
                .padding(8)
                .clipShape(Capsule())
                .offset(x: -5, y: -5)
                .padding()
        }
        .padding()
    }
}

#Preview {
    Logo()
}
