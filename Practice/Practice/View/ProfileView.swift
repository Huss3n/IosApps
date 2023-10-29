//
//  ProfileView.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct ProfileView: View {
    let url = URL(string: "https://picsum.photos/300")
    @AppStorage("user_is_signin") var userIsSignedin: Bool = false
    @FetchRequest(sortDescriptors: []) var userdetails:FetchedResults<Userdetails>
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
            ZStack{
                RadialGradient(
                    gradient: Gradient(colors: [.red, .blue, .green]),
                    center: .topLeading,
                    startRadius: 10,
                    endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                
                ScrollView{
                    VStack(spacing: 30){
                        profileImage
                        userDetails
                        signOutButton
                        
                    }
                }
            }
    }
    
    func deleteData(){
        let user = userdetails
//        user.delete(user)
        
        try? moc.save()
     
    }
    
    // MARK: FUGURE OUT HOW TO EDIT/ DELETE COREDATA DATA
    func signOut(){
        deleteData()
        withAnimation(.spring) {
            userIsSignedin = false
        }
    }
}

//#Preview {
//    ProfileView()
//}


extension ProfileView {
    private var profileImage: some View {
        AsyncImage(url: url) { returnedImage in
            returnedImage
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .overlay {
                    Circle()
                        .stroke(.black, lineWidth: 2.0)
                        .frame(width: 100, height: 100)
                }
                .shadow(radius: 10)
                .padding()
        } placeholder: {
            ProgressView()
        }
    }
    
    private var userDetails: some View {
        VStack(spacing: 20){
            ForEach(userdetails, id: \.self){detail in
                Text(detail.username ?? "Username")
                    .font(.title)
                    
                Text(detail.email ?? "Email")
                    .font(.headline)
                
                Text("Age: 23")
                    .font(.callout)
                Text(detail.bio ?? "Bio")
                
                Text(detail.password ?? "Password")
            }
        }
    }
    
    private var signOutButton: some View {
        Button(action: {
            signOut()
        }, label: {
            Label("Sign out".uppercased(), systemImage: "figure.run")
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.white)
                .foregroundStyle(.purple)
                .font(.headline)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
        })
        .padding()
    }
}
