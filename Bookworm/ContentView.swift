//
//  ContentView.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    /*
        // 🟢 @Environment→ A property wrapper that reads a value from a view’s environment.
     
        // → A model context is central to SwiftData as it’s responsible for managing the entire lifecycle of your persistent models.
        // 🟢 ModelContext → An object that enables you to fetch, insert, and delete models, and save any changes to disk.
        // → ModelContext has the job of tracking all objects that have been created, modified, and deleted in memory, so they can all be saved to the model container at some later point.
     */
    @Environment(\.modelContext) var modelContext
    
    /*
        // → Retrieving information from SwiftData is done using a query.
        // → We describe what we want, how it should sorted, and whether any filters should be used, and SwiftData sends back all the matching data.
        // 🟢 Query → A type that fetches models using the specified criteria, and manages those models so they remain in sync with the underlying data.
     */
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        // → A view that displays a root view and enables you to present additional views over the root view.
        // → People can add views to the top of the stack by clicking or tapping a NavigationLink
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer()
                        Text("Bookworm").font(.system(.title2, design: .serif).bold())
                    }
                }
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    // function
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
