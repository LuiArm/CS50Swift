//
//  ProfileView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var progress: ProgressStore

    var body: some View {
        NavigationStack {

            List {

                Section {
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

                    HStack {
                        Text("Completed")
                        Spacer()
                        Text(
                            "\(progress.completed.count) / \(CourseData.problems.count)"
                        )
                        .foregroundStyle(.secondary)
                    }

                    HStack {
                        Text("Progress")
                        Spacer()
                        Text(
                            "\(Int(progress.completionPercentage * 100))%"
                        )
                        .foregroundStyle(.secondary)
                    }

                    ProgressView(
                        value: progress.completionPercentage
                    )
                    .tint(.red)
                }

                Section("Favorites") {

                    let favorites = CourseData.problems.filter {
                        progress.isFavorite($0)
                    }

                    if favorites.isEmpty {
                        Text("No favorites yet.")
                            .foregroundStyle(.secondary)
                    } else {

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

