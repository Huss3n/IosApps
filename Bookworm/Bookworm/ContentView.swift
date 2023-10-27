//
//  ContentView.swift
//  Bookworm
//
//  Created by Muktar Hussein on 26/10/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(books){book in
                    NavigationLink {
                        BookDetailView(book: book)
                    }label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteBook(at: indexSet)
                })
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {showSheet.toggle()}, label: {
                        Text("Add")
                        Image(systemName: "plus")
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $showSheet,
               content: {AddBookView()
                .presentationDetents([.fraction(0.9)])
        })
        
    }
    
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        // save the changes
        try? moc.save()
    }
}

#Preview {
    ContentView()
}
