//
//  UserSessionview.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct UserSessionview: View {
    @AppStorage("user_is_signin") var userIsSignedin: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.red, .blue, .green]),
                center: .topLeading,
                startRadius: 10,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if userIsSignedin {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }else {
                WelcomeView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

//#Preview {
//    UserSessionview()
//}
