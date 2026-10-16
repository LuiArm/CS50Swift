//
//  ContentView.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Learn", systemImage: "house")
                }
            ProblemsView()
                .tabItem {
                    Label("Problems", systemImage: "list.bullet")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Label("Me", systemImage: "person")
                }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
