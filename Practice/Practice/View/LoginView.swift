//
//  LoginView.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var title = ""
    @State private var message = ""
    
    var body: some View {
        ZStack {
            background
                VStack {
                    Logo()
                    inputFields
                    signInButton
                    
                    NavigationLink("Don't have an acount? Sign Up", destination: {
                        SignUpView().navigationBarBackButtonHidden(true)
                    })
                    .foregroundStyle(.black)
                    
                    Spacer()
                }

        }
        .alert(title, isPresented: $showAlert){
            Button("Ok", role: .none, action: {})
        }message: {
            Text(message)
        }
    }
    
    func fieldchecker() {
       if email.isEmpty {
            showAlert = true
            title = "Check email"
            message = "Email cannot be empty"
        }else if password.count < 8 {
            showAlert = true
            title = "Password"
            message = "Password needs to be atleast eight characters long"
        }
    }
    
    func signIn(){
        fieldchecker()
        // sign in logic
    }
}

#Preview {
    LoginView()
}


extension LoginView {
    private var background: some View {
        RadialGradient(
            gradient: Gradient(colors: [.red, .blue, .green]),
            center: .topLeading,
            startRadius: 10,
            endRadius: UIScreen.main.bounds.height)
        .ignoresSafeArea()
    }
    private var inputFields: some View {
        VStack {
            // Email field
            HStack {
                Image(systemName: "envelope.badge")
                    .font(.title)
                TextField("Enter email", text: $email)
                    .padding(.leading, 10)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .padding()
            
            // Password field
            HStack {
                Image(systemName: "exclamationmark.lock")
                    .font(.title)
                SecureField("Enter password", text: $password)
                    .padding(.leading, 10)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .padding()
        }
    }
    
    private var signInButton: some View {
        Button(action: {
            signIn()
        }, label: {
            Text("Sign In")
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(Capsule())
        })
        .padding()
    }
}
