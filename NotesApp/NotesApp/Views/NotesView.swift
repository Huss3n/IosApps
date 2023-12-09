//
//  NotesView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct NotesView: View {
    @EnvironmentObject var viewModel: NotesViewModel
    var listColors: [Color] = [Color("color1"), Color("color2"), Color("color3"), Color("color4"), Color("color5"), Color("color6")]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgrouncColor")
                    .ignoresSafeArea()
                
                List {
                    ForEach(viewModel.notesByUser)  { note in
                        NavigationLink {
                            SampleNotesView(selectedNote: note)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            ListRowItem(title: note.title, color: listColors.randomElement() ?? .red)
                        }
                        .listRowBackground(Color("backgroundColor"))
                        
                    }
                    .onMove(perform: { indices, newOffset in
                        viewModel.move(from: indices, to: newOffset)
                    })
                    .onDelete(perform: viewModel.delete)
                }
                .listStyle(.plain)
                .padding()
            }
        }
    }
}

#Preview {
    NotesView()
        .environmentObject(NotesViewModel())
}
