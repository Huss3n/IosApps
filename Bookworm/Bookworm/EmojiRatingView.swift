//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct EmojiRatingView: View {
    @State var rating: Int16
    var body: some View {
        switch rating {
        case 1:
            return Text("🤢")
        case 2:
            return Text("🙃")
        case 3:
            return Text("😄")
        case 4:
            return Text("🤯")
        default:
            return Text("🤩")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 4)
}
