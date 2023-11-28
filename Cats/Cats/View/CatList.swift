//
//  CatRow.swift
//  Cats
//
//  Created by Muktar Hussein on 01/11/2023.
//

import SwiftUI

struct CatList: View {
    @StateObject var vm = CatViewModel()
    var body: some View {
        List {
            ForEach(vm.cats){cat in
                VStack(alignment: .leading) {
                    CommentRow(name: cat.name, email: cat.email)
                }
            }
        }
    }
}

#Preview {
    CatList()
}
