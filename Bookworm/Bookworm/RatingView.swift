//
//  RatingView.swift
//  Bookworm
//
//  Created by Muktar Hussein on 26/10/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    let maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor: Color = .gray
    var onColor: Color = .yellow
    
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self){number in
                image(for: number)
                    .foregroundStyle(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        }else {
            return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
