//
//  SearchView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        TextField("", text: $searchText,
                                  prompt: Text("Search by keyword...")
                            .foregroundStyle(.white.opacity(0.7))
                        )
                            .padding(.leading)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                      Rectangle()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color("iconColor"))
                            .padding()
                            .overlay {
                                Text("X")
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                searchText = ""
                                dismiss()
                            }
                    }
                    .frame(width: 360, height: 50)
                    .background(Color("iconColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    
                    
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Search")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                }
            }
        }
    }
    
}


struct Preview_Provider: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
