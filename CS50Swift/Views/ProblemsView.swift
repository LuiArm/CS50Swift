//
//  ProblemsView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct ProblemsView: View {
    @EnvironmentObject var progress: ProgressStore
    @State private var selectedWeek: Int?
    
    init(selectedWeek: Int? = nil) {
        _selectedWeek = State(initialValue: selectedWeek)
    }
    
    private var filteredProblems: [Problem] {
        if let selectedWeek {
            return CourseData.problems.filter {
                $0.week == selectedWeek
            }
        }
        return CourseData.problems
    }
    var body: some View {
        NavigationStack {

                    List {

                        Section {
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
