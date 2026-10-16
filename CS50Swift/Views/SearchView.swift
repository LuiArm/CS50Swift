//
//  SearchView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
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
            
            Group {
                
                if searchText.isEmpty {
                    
                    ContentUnavailableView(
                        "Search Problems",
                        systemImage: "magnifyingglass",
                        description: Text(
                            "Search by problem, concept, or topic."
                        )
                    )
                    
                } else if results.isEmpty {
                    
                    ContentUnavailableView.search(
                        text: searchText
                    )
                    
                } else {
                    
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
            .searchable(
                text: $searchText,
                prompt: "Problems, concepts..."
            )
        }
    }
}


