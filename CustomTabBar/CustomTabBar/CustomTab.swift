//
//  CustomTab.swift
//  CustomTabBar
//
//  Created by Muktar Hussein on 29/10/2023.
//

import SwiftUI

struct CustomTab: View {
    let tabItems: [(image: String, title: String)] = [
        ("house", "Home"),
        ("magnifyingglass", "Search"),
        ("heart", "Favorites"),
        ("person", "Profile"),
        ("gear", "Settings")
    ]
    
    @Binding var tabSelection: Int
    @Namespace var animationNamespace
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundStyle(Color(.secondarySystemBackground))
                .shadow(color: .primary.opacity(0.5), radius: 2)
            
            HStack(spacing: 10){
                ForEach(0..<5){ item in
                    Button(action: {
                        withAnimation(.easeIn) {
                            tabSelection = item + 1
                        }
                    }, label: {
                        VStack(spacing: 10)  {
                            Image(systemName: tabItems[item].image)
//                                .font(.caption)
                            Text(tabItems[item].title)
                                .font(.caption)
                            
                            if item + 1 == tabSelection {
                                Capsule()
                                    .frame(width: 50, height: 6)
                                    .matchedGeometryEffect(id: "id", in: animationNamespace)
                                    .offset(y: 3)
                            }else {
                                Capsule()
                                    .frame(width: 50, height: 6)
                                    .offset(y: 3)
                                    .foregroundStyle(.clear)
                            }
                        }
                        .foregroundStyle(item + 1 == tabSelection ? .blue : .gray)
                    })
                }
            }
//            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTab(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
}
