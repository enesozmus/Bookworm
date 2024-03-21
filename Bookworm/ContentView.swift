//
//  ContentView.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftUI

struct ContentView: View {
    /*
        // → A model context is central to SwiftData as it’s responsible for managing the entire lifecycle of your persistent models.
        // 🟢 ModelContext → An object that enables you to fetch, insert, and delete models, and save any changes to disk.
     */
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
