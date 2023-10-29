//
//  ContentView.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<Userdetails>
    var body: some View {
            VStack {
                UserSessionview()
            }
    }
}

//#Preview {
//    ContentView()
//}
