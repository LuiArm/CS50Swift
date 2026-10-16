//
//  CS50SwiftApp.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import SwiftUI

@main
struct CS50SwiftApp: App {
    @StateObject private var progressStore = ProgressStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressStore)
                .preferredColorScheme(.dark)
                .tint(AppTheme.red)
        }
    }
}
