//
//  TextFieldView.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        HStack {
            Image(systemName: "envelope.badge")
                .font(.title)
            TextField("Enter email", text: $email)
                .padding(.leading, 10)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                .padding(.horizontal)
        }
        .padding()
            
        HStack {
            Image(systemName: "exclamationmark.lock")
                .font(.title)
            SecureField("Enter Password", text: $email)
                .padding(.leading, 10)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                .padding(.horizontal)
        }
        .padding()
    }
}

//#Preview {
//    TextFieldView()
//}
