//
//  ContentView.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import SwiftUI

struct ContentView: View {
    // Note: ProgressStore is created at app launch (e.g., in App.swift) with @StateObject and injected via .environmentObject(progress) so all tabs can access shared progress.
    // Note: Each tab manages its own NavigationStack internally (e.g., HomeView, ProblemsView, SearchView, ProfileView) to push to detail screens independently.
    // The main view containing the TabView with all primary sections of the app.
    var body: some View {
        // Root view hosting the main tabs of the app
        TabView {
            
            HomeView() // Learn tab
                .tabItem {
                    Label("Learn", systemImage: "house")
                }
            ProblemsView() // Problems tab
                .tabItem {
                    Label("Problems", systemImage: "list.bullet")
                }
            
            SearchView() // Search tab
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ProfileView() // Profile tab
                .tabItem {
                    Label("Me", systemImage: "person")
                }
        }
        // Set a consistent accent color across the app (buttons, tab items, etc.)
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
