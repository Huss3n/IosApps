//
//  ScalingViews.swift
//  Theory
//
//  Created by Muktar Hussein on 29/09/2023.
//

import SwiftUI


// modifier
//struct newMode: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.title)
//            .foregroundColor(.white)
//            .padding()
//            .background(.purple.opacity(0.75), in: Capsule())
//    }
//}

struct KeywordBubble: View {
    var label: String
    var symbol: String
    var body: some View {
        Label(label, systemImage: symbol)
    }
}



