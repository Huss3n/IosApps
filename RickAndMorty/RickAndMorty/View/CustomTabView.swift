//
//  CustomTabView.swift
//  RickAndMorty
//
//  Created by Muktar Hussein on 20/11/2023.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
        }
    }
}

#Preview {
    CustomTabView()
}
