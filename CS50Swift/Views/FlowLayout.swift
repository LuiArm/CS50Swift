//
//  FlowLayout.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct FlowLayout: View {
    let items: [String]
    
    var body: some View {
        
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 100))
            ],
            alignment: .leading,
            spacing: 8
        ) {
            
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

