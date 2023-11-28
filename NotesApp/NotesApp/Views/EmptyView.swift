//
//  EmptyView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    
                    Image("rafiki")
                    Text("Create your first note !")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Spacer()
                    
                }
            }
        }
    }
}

#Preview {
    EmptyView()
}
