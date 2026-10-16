//
//  ConceptView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct ConceptView: View {
    let title: String
    let description: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(description)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Coming soon")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("""
                    This section will contain a concise explanation,
                    Swift examples, diagrams, and links to problems
                    that use this concept.
                    """)
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
