//
//  PracticeApp.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import SwiftUI

@main
struct PracticeApp: App {
    @StateObject private var userDataModel = UserDataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, userDataModel.container.viewContext)
        }
    }
}
