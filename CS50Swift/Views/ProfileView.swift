//
//  ProfileView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

// Profile screen: app identity, progress summary, and favorites list
struct ProfileView: View {
    
    // Shared progress store used to compute stats and favorites
    @EnvironmentObject var progress: ProgressStore
    
    var body: some View {
        NavigationStack {
            
            // Sections for profile card, progress, and favorites
            List {
                
                Section {
                    // App identity card with Swift logo and tagline
                    VStack(spacing: 12) {
                        
                        ZStack {
                            
                            Circle()
                                .fill(Color.red.opacity(0.15))
                                .frame(
                                    width: 90,
                                    height: 90
                                )
                            
                            Image(systemName: "swift")
                                .font(.system(size: 42))
                                .foregroundStyle(.red)
                        }
                        
                        Text("CS50 Swift")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Offline learning")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                }
                
                Section("Progress") {
                    
                    // Completed count
                    HStack {
                        Text("Completed")
                        Spacer()
                        Text(
                            "\(progress.completed.count) / \(CourseData.problems.count)"
                        )
                        .foregroundStyle(.secondary)
                    }
                    
                    // Percentage of completion
                    HStack {
                        Text("Progress")
                        Spacer()
                        Text(
                            "\(Int(progress.completionPercentage * 100))%"
                        )
                        .foregroundStyle(.secondary)
                    }
                    
                    // Visual progress bar
                    ProgressView(
                        value: progress.completionPercentage
                    )
                    .tint(.red)
                }
                
                Section("Favorites") {
                    // Compute favorite problems from the store
                    let favorites = CourseData.problems.filter {
                        progress.isFavorite($0)
                    }
                    
                    // Empty state when there are no favorites
                    if favorites.isEmpty {
                        Text("No favorites yet.")
                            .foregroundStyle(.secondary)
                    } else {
                        // List each favorite problem; tap to view details
                        ForEach(favorites) { problem in
                            NavigationLink {
                                ProblemsDetailView(problem: problem)
                            } label: {
                                Text(problem.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Me")
        }
    }
}

