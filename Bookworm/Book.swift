//
//  Book.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftData

@Model
class Book {
    /*
        // → We can turn that into a SwiftData object by making two very small changes.
     
            1. import SwiftData             → That tells Swift we want to bring in all the functionality from SwiftData.
            2. @Model class Book { }        → This class is called a SwiftData model
     */
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}


/*
    // → 🌆 SwiftUI is a powerful, modern framework for building great apps on all of Apple's platforms.

    // → 🌆 SwiftData is a powerful, modern framework for storing, querying, and filtering data.
 
    // → SwiftData and SwiftUI work together to provide live updates to your views when the underlying data changes, with no need to manually refresh the results.
 */


/*
    // → The app development skill you’ll be learning is one of Apple’s frameworks: SwiftData. It’s responsible for managing objects in a database, including reading, writing, filtering, sorting, and more, and it’s hugely important in app development for iOS, macOS, and beyond.
    // → SwiftData is an object graph and persistence framework, which is a fancy way of saying it lets us define objects and properties of those objects, then lets us read and write them from permanent storage.
 
    // → SwiftData makes it easy to persist data using declarative code.
    // → You can query and filter data using regular Swift code.
    // → And it’s designed to integrate seamlessly with SwiftUI.
    // → Model your data using regular Swift types with @Model, with no additional files or tools to manage.
 */
