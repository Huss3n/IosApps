//
//  TheoryApp.swift
//  Theory
//
//  Created by Muktar Hussein on 29/09/2023.
//

// the apps entry point
import SwiftUI
@main

struct MyApp: App {
    var body: some Scene {
        WindowGroup{
            TabView {
                Journal()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                ContentView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

