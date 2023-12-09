//
//  BookDetailView.swift
//  Bookworm
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "fantasy")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(book.genre?.uppercased() ?? "Unknown Title")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    showAlert = true
                }label: {
//                    Text("Delete this book")
                    Image(systemName: "trash")
                }
            }
        })
        .alert("Delete book", isPresented: $showAlert){
            Button("Delete", role: .destructive, action: (deleteBook))
            Button("Cancel", role: .cancel, action: {})
        }message: {
            Text("This action will delete the book. It cannot be undone")
        }
    }
    
    func deleteBook(){
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}

