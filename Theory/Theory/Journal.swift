//
//  Journal.swift
//  Theory
//
//  Created by Muktar Hussein on 29/09/2023.
//

import SwiftUI
struct Journal: View {
    @State private var notes = ["Note 1", "Note 2", "Note 3", "Note 4"]
    var body: some View{
        List(notes, id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    Journal()
}
