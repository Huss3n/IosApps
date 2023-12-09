//
//  CommentRow.swift
//  Cats
//
//  Created by Muktar Hussein on 02/11/2023.
//

import SwiftUI

struct CommentRow: View {
    var vm = CatViewModel()
    
    @State  var name: String
    @State  var email: String
    
    var body: some View {
        ForEach(vm.cats){cat in
            HStack {
                Text(cat.name)
                Text(cat.email)
            }
        }
    }
}


