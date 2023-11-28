//
//  RootView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct RootView: View {
    @State private var showSearch: Bool = false
    @EnvironmentObject var viewModel: NotesViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                if viewModel.notesByUser.isEmpty {
                    EmptyView()
                } else {
                    NotesView()
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            AddView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color("iconColor"))
                                .overlay {
                                    Image(systemName: "plus")
                                        .font(.title.bold())
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Notes")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        // MARK: Search
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color("iconColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
                                showSearch.toggle()
                            }
                        
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color("iconColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                               EditButton()
                                    .padding()
                                    .tint(.white)
                            }
                        

                    }
                    .padding()
                }
            }
        }
        .fullScreenCover(isPresented: $showSearch, content: {
            SearchView()
        })
    }
}


#Preview {
    RootView()
        .environmentObject(NotesViewModel())
}
