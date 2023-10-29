//
//  WelcomeView.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(
                    gradient: Gradient(colors: [.red, .blue, .green]),
                    center: .topLeading,
                    startRadius: 10,
                    endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                VStack(spacing: 20) {
                    Logo()
                    
                    Text("Welcome to Chatty")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("A simple chat platform for everyday use")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding()
                    
                    Text("Login or Sign up to continue")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    // MARK: Sign up button
                    NavigationLink {
                        SignUpView().navigationBarBackButtonHidden(true)
                    }label: {
                            Text("Sign Up")
                                .foregroundStyle(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .clipShape(Capsule())                        
                    }
                    
                    // MARK: Sign In button
                    NavigationLink {
                        LoginView().navigationBarBackButtonHidden(true)
                    }label: {
                            Text("Sign In")
                                .foregroundStyle(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .clipShape(Capsule())
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
