//
//  SampleNotesView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct SampleNotesView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: NotesViewModel
    @State private var deleteAlert: Bool = false
    @State private var editedNotes: String
    
    var selectedNote: NotesModel
    
    init(selectedNote: NotesModel) {
         self.selectedNote = selectedNote
         _editedNotes = State(initialValue: selectedNote.notes)
     }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(selectedNote.title)
                        .font(.title)
                        .padding(.leading, 4)
                        .padding(.top, 4)
                    
//                    Text(selectedNote.notes)
                    TextEditor(text: $editedNotes)
                        .foregroundColor(.white)
                        
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding(8)
            }
            .alert("Delete book", isPresented: $deleteAlert) {
                Button("Cancel",  role: .cancel, action: {})
                Button("Delete", role: .destructive, action: {
                    dismiss()
                })
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Rectangle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color("iconColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            Image(systemName: "lessthan")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                                .onTapGesture {
                                    // navigate back
                                    dismiss()
                                }
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color("iconColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                Image(systemName: "pencil")
                                    .foregroundStyle(.white)
                            }
                        
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color("iconColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                Image(systemName: "trash")
                                    .foregroundStyle(.red)
                            }
                            .onTapGesture {
                                // show alert
                                deleteAlert.toggle()
                            }
                    }
                }
            }
        }
    }
}

struct SampleNotesView_Preview: PreviewProvider {
    static var previews: some View {
        let sampleNote = NotesModel(title: "Hello", notes: "Hello world")
        SampleNotesView(selectedNote: sampleNote)
    }
}
