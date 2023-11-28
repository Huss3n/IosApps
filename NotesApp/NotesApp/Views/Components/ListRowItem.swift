//
//  ListRowItem.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

struct ListRowItem: View {
    var title: String
    var color: Color
    
    var body: some View {
        HStack {
                Text(title)
                    .padding()
        }
//        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

