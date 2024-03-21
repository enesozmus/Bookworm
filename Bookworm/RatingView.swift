//
//  RatingView.swift
//  Bookworm
//
//  Created by enesozmus on 21.03.2024.
//

import SwiftUI

struct RatingView: View {
    // 🟢 @Binding → A property wrapper type that can read and write a value owned by a source of truth.
    // → Use a @Binding to create a two-way connection between a property that stores data, and a view that displays and changes the data.
    @Binding var rating: Int

    var label = ""
    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }

    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
