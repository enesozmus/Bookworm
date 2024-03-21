//
//  AddBookView.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    /*
        // → An action that dismisses the current presentation.
            
            1. Dismiss a modal presentation, like a sheet or a popover.
            2. Pop the current view from a NavigationStack.
            3. Close a window that you create with WindowGroup or Window.
     */
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                // ...
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                // ...
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                // ...
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, addedDate: Date())
                        // → Registers the specified model with the context so it can include the model in the next save operation.
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer()
                        Text("Add Book").font(.system(.title2, design: .serif).bold())
                    }
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
