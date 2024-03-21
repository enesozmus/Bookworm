//
//  DetailView.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var bookAddedDate: String? {
        book.addedDate.formatted(date: .abbreviated, time: .shortened)
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            .padding([.leading, .top, .trailing])
            
            // ...
            VStack {
                Text(book.title)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                Text("by \(book.author)")
                    .font(.callout)
            }
            .padding()
            
            Text(book.review)
                .font(.system(.callout, design: .serif).italic())
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            Divider()
            VStack {
                Text("Added \(bookAddedDate!)")
                    .font(.caption)
                Spacer()
                HStack {
                    Text("You rated it")
                    RatingView(rating: .constant(Int(book.rating)))
                }
                .font(.caption)
            }
            .foregroundColor(.secondary)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        /*
             // 🟢 ModelConfiguration→ A type that describes the configuration of an app’s schema or specific group of models.
             // → ModelConfiguration determines how and where data is stored, including which CloudKit container to use if any, and whether saving should be enabled or not.
             // → This configuration is provided to your model container to determine how it behaves.
         */
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4, addedDate: Date())
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
