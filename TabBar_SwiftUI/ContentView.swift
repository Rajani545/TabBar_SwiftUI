//
//  ContentView.swift
//  TabBar_SwiftUI
//
//  Created by Rajani Karukola on 2024-09-18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                defaultView(text: "Home").tag(Tab.home)
                defaultView(text: "Search").tag(Tab.search)
                defaultView(text: "Categories").tag(Tab.categories)
                defaultView(text: "My List").tag(Tab.myList)
            }
            
            customTabBar()
        }
       
    }
    
    @ViewBuilder
    func customTabBar(_ tint: Color = .black, _ inactiveTint: Color = .gray) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePosition)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x:0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

struct defaultView: View {
    let text: String
    var body: some View {
        VStack {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
