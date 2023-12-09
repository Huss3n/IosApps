//
//  CustomAlertView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 30/11/2023.
//

import SwiftUI

struct CustomAlertView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showDiscardAlert: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "info.circle")
                .font(.title)
                .foregroundStyle(Color("alertColor"))
                .background(Color("titleColor"))
                .clipShape(Circle())
                .padding()
            
            Text("Are you sure you want to discard changes ?")
                .foregroundStyle(.white)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Text("Discard")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 112, height: 39)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button {
                    showDiscardAlert  = false
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 112, height: 39)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }


            }
            .padding()
        }
        .frame(width: 330, height: 236)
        .background(Color("alertColor").opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    CustomAlertView(showDiscardAlert: .constant(false))
}
