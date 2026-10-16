//
//  LearnView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct LearnView: View {
    private let topics = [
        ("Variables", "var, let, types and values"),
        ("Arrays", "Collections of ordered values"),
        ("Dictionaries", "Key-value data structures"),
        ("Functions", "Reusable blocks of code"),
        ("Structs", "Creating custom data types"),
        ("Optionals", "Representing missing values"),
        ("Algorithms", "Steps for solving problems"),
        ("Data Structures", "Organizing and storing data")
    ]
    
    var body: some View {
        NavigationStack {
            
            List {
                
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Swift Fundamentals")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(
                            "Build the Swift knowledge needed to solve the problem sets."
                        )
                        .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                
                Section("Topics") {
                    
                    ForEach(topics, id: \.0) { topic in
                        
                        NavigationLink {
                            
                            ConceptView(
                                title: topic.0,
                                description: topic.1
                            )
                            
                        } label: {
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text(topic.0)
                                    .fontWeight(.semibold)
                                
                                Text(topic.1)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Learn")
        }
    }
}
