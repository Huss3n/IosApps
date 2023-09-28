//
//  Lists.swift
//  CodeTrials
//
//  Created by Muktar Hussein on 28/09/2023.
//
// working with lists
import SwiftUI

struct ListingsClass: View {
    var names = ["Hussein", "Aisak", "Muktar"]
    var body: some View {
        List(names, id: \.self) {
            Text($0)
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    ListingsClass()
}
