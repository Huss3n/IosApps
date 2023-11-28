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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.notesByUser){ note in
                        Text(note.title)
                            .font(.title.bold())
                        Text(note.notes)
                            .lineSpacing(4)
                    }
                    
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding(20)
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

#Preview {
    SampleNotesView()
        .environmentObject(NotesViewModel())
}
