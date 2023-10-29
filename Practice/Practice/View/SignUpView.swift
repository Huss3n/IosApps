//
//  SignUpView.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userdetails: FetchedResults<Userdetails>
    
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var title = ""
    @State private var message = ""
    @AppStorage("user_is_signin") var userIsSignedin: Bool = false

    
    var body: some View {
            ZStack {
                background
                signUpExtension
                
            }
        .alert(title, isPresented: $showAlert){
            
        }message: {
            Text(message)
        }
    }
    
    

    // signup func
    func fieldchecker() -> Bool{
        if username.count < 3 {
            showAlert = true
            title = "Check username"
            message = "Username needs to be three characters long"
            return false
        }else if email.isEmpty {
            showAlert = true
            title = "Check email"
            message = "Email cannot be empty"
            return false
        }else if password.count < 8 {
            showAlert = true
            title = "Password"
            message = "Password needs to be atleast eight characters long"
            return false
        }
        return true
    }
    func saveUserData() {
        let user = Userdetails(context: moc)
        user.id = UUID()
        user.username = username
        user.email = email
        user.password = password
        user.age = 0
        user.bio = "This is your bio"
        
        try? moc.save()
    }
    
    func signUp(){
        saveUserData()
        withAnimation(.spring) {
            userIsSignedin = true
        }
    }
}

#Preview {
    SignUpView()
}
extension SignUpView {
    private var background: some View {
        RadialGradient(
            gradient: Gradient(colors: [.red, .blue, .green]),
            center: .topLeading,
            startRadius: 10,
            endRadius: UIScreen.main.bounds.height)
        .ignoresSafeArea()
    }
    
    private var inputFields: some View {
        // usermname field
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .font(.title)
                TextField("Enter username", text: $username)
                    .padding(.leading, 10)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .padding()
            
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
    
    private var buttonSignup: some View {
            Text("Sign Up")
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(Capsule())
                .onTapGesture {
                    if fieldchecker(){
                        signUp()
                    }
                }
                .padding()
        
    }
    private var signUpExtension: some View {
        VStack{
            Logo()
            inputFields
            buttonSignup
            
            NavigationLink("Have an acount? Sign In", destination: {
                LoginView().navigationBarBackButtonHidden(true)
            })
            .foregroundStyle(.black)
            
                .padding()
                Spacer()
        }
    }
}
