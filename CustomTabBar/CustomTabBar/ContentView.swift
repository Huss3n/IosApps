//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Muktar Hussein on 29/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tabBarSelection = 1
    var body: some View {
        TabView(selection: $tabBarSelection) {
            Text("Tab Content 1")
                .tabItem {
                    Text("Tab Label 1")
                }
                .tag(1)
            Text("Tab Content 2")
                .tabItem {
                    Text("Tab Label 2")
                }
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            CustomTab(tabSelection: $tabBarSelection)
        }
    }
}

#Preview {
    ContentView()
}
