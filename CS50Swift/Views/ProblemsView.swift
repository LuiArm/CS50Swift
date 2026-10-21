//
//  ProblemsView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

// Problems screen: filter problems by week and navigate to details
struct ProblemsView: View {
    // Shared progress store for status indicators in rows
    @EnvironmentObject var progress: ProgressStore
    // Optional filter bound to the Picker; nil means all weeks
    @State private var selectedWeek: Int?
    
    // Allow deep-linking from HomeView to preselect a week
    init(selectedWeek: Int? = nil) {
        _selectedWeek = State(initialValue: selectedWeek)
    }
    
    // Compute filtered problems based on selectedWeek
    private var filteredProblems: [Problem] {
        if let selectedWeek {
            return CourseData.problems.filter {
                $0.week == selectedWeek
            }
        }
        return CourseData.problems
    }
    var body: some View {
        // Navigation container for list and detail navigation
        NavigationStack {

                    List {

                        Section {
                            // Filter control; selecting a week updates filteredProblems
                            Picker("Week", selection: $selectedWeek) {
                                Text("All Weeks")
                                    .tag(Optional<Int>.none)

                                ForEach(CourseData.weeks) { week in
                                    Text("\(week.title) · \(week.subtitle)")
                                        .tag(Optional(week.id))
                                }
                            }
                        }

                        Section("Problems") {

                            // Show each problem with a navigation link to its detail view
                            ForEach(filteredProblems) { problem in

                                NavigationLink {
                                    ProblemsDetailView(problem: problem)
                                } label: {
                                    ProblemRow(problem: problem)
                                }
                            }
                        }
                    }
                    .navigationTitle("Problems")
                }
    }
}

#Preview {
    ProblemsView()
}

