//
//  FlowLayout.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

// Displays an array of strings as adaptive tag-like chips in a grid
struct FlowLayout: View {
    let items: [String]
    
    var body: some View {
        
        // Adaptive grid ensures items wrap to new lines based on available width
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 100))
            ],
            alignment: .leading,
            spacing: 8
        ) {
            
            // Render each concept as a styled capsule
            ForEach(items, id: \.self) { item in
                
                Text(item)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.red.opacity(0.15))
                    )
                    .foregroundStyle(.red)
            }
        }
    }
}

