//
//  SearchView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

// Search screen: query problems by title, summary, category, or concepts
struct SearchView: View {
    // Two-way bound to the navigation bar search field
    @State private var searchText = ""
    
    // Filter problems by matching query across multiple fields
    private var results: [Problem] {
        
        guard !searchText.isEmpty else {
            return []
        }
        
        let query = searchText.lowercased()
        
        return CourseData.problems.filter { problem in
            
            problem.title.lowercased().contains(query)
            || problem.summary.lowercased().contains(query)
            || problem.category.lowercased().contains(query)
            || problem.concepts.contains {
                $0.lowercased().contains(query)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            // Show different content depending on query and results
            Group {
                
                // Initial prompt when no search text is entered
                if searchText.isEmpty {
                    
                    ContentUnavailableView(
                        "Search Problems",
                        systemImage: "magnifyingglass",
                        description: Text(
                            "Search by problem, concept, or topic."
                        )
                    )
                    
                } else if results.isEmpty {
                    
                    // System-provided empty state for no results
                    ContentUnavailableView.search(
                        text: searchText
                    )
                    
                } else {
                    
                    // Show matching problems; tap to open details
                    List(results) { problem in
                        
                        NavigationLink {
                            ProblemsDetailView(problem: problem)
                        } label: {
                            ProblemRow(problem: problem)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            // Adds the search field to the navigation bar
            .searchable(
                text: $searchText,
                prompt: "Problems, concepts..."
            )
        }
    }
}


