//
//  AddBookView.swift
//  Bookworm
//
//  Created by Muktar Hussein on 26/10/2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack {
            Form {
                Section("Book description") {
                    TextField("Book name", text: $title)
                    TextField("Author's name", text: $author)
                }
                
                Section("Book Review") {
                    Picker(selection: $genre) {
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    } label: {
                        //
                        Text("Choose Book Genre")
                    }
                    .pickerStyle(.menu)

                    
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                Section {                    
                    Button(action: {
                        if title.count == 0 {
                            return
                        }else {
                            saveBook()
                            dismiss()
                        }
                    }, label: {
                        Text("Add Book")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(Capsule())
                        
                    })
                }
            }
            .navigationTitle("Add Book")
          
        }
    }
    
    // function to save the book
    func saveBook(){
        let newBook = Book(context: moc)
        newBook.id = UUID()
        newBook.title = title
        newBook.author = author
        newBook.genre = genre
        newBook.review = review
        newBook.rating = Int16(rating)
        
        try? moc.save()
    }
}

#Preview {
    AddBookView()
}
