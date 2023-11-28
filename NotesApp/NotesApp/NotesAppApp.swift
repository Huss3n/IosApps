//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject private var viewModel = NotesViewModel()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(viewModel)
        }
    }
}
