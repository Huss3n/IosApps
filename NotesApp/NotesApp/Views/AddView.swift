//
//  AddView.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct AddView: View {
    @State private var title: String = ""
    @State private var notes: String = ""
    var color: Color = Color("titleColor")
    @State private var showDiscardAlert: Bool = false
    
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: NotesViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    TextField("",
                              text: $title,
                              prompt: Text("Title")
                        .foregroundStyle(color)
                        .font(.system(size: 50))
                    )
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    
                    ZStack(alignment: .topLeading) {
                      TextEditor(text: $notes)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
                        if notes.isEmpty {
                            Text("Type Something..")
                                .padding(.top, 8)
                                .padding(.leading, 4)
                                .font(.headline)
                                .foregroundStyle(color)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(20)
                .blur(radius: showDiscardAlert ? 2 : 0)
                
                if showDiscardAlert {
                    withAnimation(.bouncy) {
                        CustomAlertView(showDiscardAlert: $showDiscardAlert)
                    }
                }
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
                                    if title.isEmpty && notes.isEmpty {
                                        dismiss()
                                    }else  {
                                        showDiscardAlert.toggle()
                                    }
                                }
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 20) {
                        Rectangle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(Color("iconColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay {
                                Image(systemName: "eye")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        
                        Rectangle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(Color("iconColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay {
                                Image("save")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.white)
                            }
                            .onTapGesture {
//                                viewModel.addUserNote(title: title, notes: notes)
                                dismiss()
                            }
                    }
                }
            }
        }
    }
}

//#Preview {
//    AddView()
//        .environmentObject(NotesViewModel())
//}

struct AddView_Preview: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

