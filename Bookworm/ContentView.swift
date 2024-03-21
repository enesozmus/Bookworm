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
        // → A model context is central to SwiftData as it’s responsible for managing the entire lifecycle of your persistent models.
        // 🟢 ModelContext → An object that enables you to fetch, insert, and delete models, and save any changes to disk.
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
    
    var body: some View {
        // → A view that displays a root view and enables you to present additional views over the root view.
        // → People can add views to the top of the stack by clicking or tapping a NavigationLink
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            // ...
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Bookworm")
    }
}

#Preview {
    ContentView()
}
