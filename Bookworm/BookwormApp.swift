//
//  BookwormApp.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftData
import SwiftUI

/*
    // → Every project has one of these, including all the projects we've made so far, and it acts as the launch pad for the whole app we're running.
    // → The @main line tells Swift this is what launches our app. Internally this is what bootstraps the whole program when the user launches our app from the iOS Home Screen.
    // → The WindowGroup part tells SwiftUI that our app can be displayed in many windows
 */
@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // → A model container is SwiftData's name for where it stores its data.
        // → The first time your app runs this means SwiftData has to create the underlying database file, but in future runs it will load the database it made previously.
        .modelContainer(for: Book.self)
    }
}
