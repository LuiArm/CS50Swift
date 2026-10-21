//
//  ProblemRow.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

// Reusable row showing a problem title, summary, and status icons
struct ProblemRow: View {
    // Read completion/favorite status from the shared store
    @EnvironmentObject var progress: ProgressStore

     let problem: Problem

     var body: some View {
         HStack(spacing: 14) {

             // Completed vs. incomplete icon
             Image(
                 systemName: progress.isCompleted(problem)
                     ? "checkmark.circle.fill"
                     : "circle"
             )
             .foregroundStyle(
                 progress.isCompleted(problem)
                     ? .green
                     : .secondary
             )
             .font(.title3)

             VStack(alignment: .leading, spacing: 4) {

                 Text(problem.title)
                     .fontWeight(.semibold)

                 Text(problem.summary)
                     .font(.caption)
                     .foregroundStyle(.secondary)
                     .lineLimit(2)
             }

             Spacer()

             // Show star for favorite problems
             if progress.isFavorite(problem) {
                 Image(systemName: "star.fill")
                     .foregroundStyle(.yellow)
             }
         }
         .padding(.vertical, 4)
     }
}


