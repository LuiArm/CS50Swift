//
//  ProblemsDetailView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

// Problem detail screen: full description, concepts, hint, pseudocode, solution, and actions
struct ProblemsDetailView: View {
    
    // Access shared progress (completed/favorites)
    @EnvironmentObject var progress: ProgressStore
    
    // The problem being displayed
    let problem: Problem
    
    // Controls whether the solution code is revealed
    @State private var showSolution = false
    
    var body: some View {
        // Scroll to accommodate long problem content
        ScrollView {
            
            VStack(alignment: .leading, spacing: 24) {
                
                header
                
                Divider()
                
                problemSection
                
                conceptsSection
                
                hintSection
                
                pseudocodeSection
                
                solutionSection
                
                completeButton
            }
            .padding()
        }
        .navigationTitle(problem.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            // Star icon reflects favorite status; action currently toggles completion (likely intended to toggle favorite)
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    progress.toggleCompleted(problem)
                } label: {
                    Image(
                        systemName: progress.isFavorite(problem)
                        ? "star.fill"
                        : "star"
                    )
                    .foregroundStyle(.yellow)
                }
            }
        }
    }
    
    // Title, week label, and summary
    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("WEEK \(problem.week)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.red)
            
            Text(problem.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(problem.summary)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    // Detailed problem statement
    private var problemSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            sectionTitle("Problem")
            
            Text(problem.description)
                .font(.body)
                .lineSpacing(5)
        }
    }
    
    // Key concepts shown as tags
    private var conceptsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            sectionTitle("Concepts")
            
            FlowLayout(items: problem.concepts)
        }
    }
    
    // Optional hint inside a disclosure group
    private var hintSection: some View {
        DisclosureGroup("Hint") {
            
            Text(problem.hint)
                .font(.body)
                .foregroundStyle(.secondary)
                .padding(.top, 8)
        }
    }
    
    // Pseudocode rendered in a code block
    private var pseudocodeSection: some View {
        DisclosureGroup("Pseudocode") {
            
            CodeBlock(code: problem.pseudocode)
                .padding(.top, 8)
        }
    }
    
    // Swift solution with a reveal/hide toggle
    private var solutionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                sectionTitle("Swift Solution")
                
                Spacer()
                
                Button(showSolution ? "Hide" : "Reveal") {
                    withAnimation {
                        showSolution.toggle()
                    }
                }
            }
            
            // Reveal the solution code when toggled
            if showSolution {
                CodeBlock(code: problem.solution)
                    .transition(.opacity)
            } else {
                VStack(spacing: 10) {
                    
                    Image(systemName: "lock.open")
                        .font(.title2)
                    
                    Text("Try the problem first")
                        .fontWeight(.semibold)
                    
                    Text("Reveal the solution when you're ready.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            }
        }
    }
    
    // Button to mark/unmark completion
    private var completeButton: some View {
        // Toggle completion state in the progress store
        Button {
            progress.toggleCompleted(problem)
        } label: {
            
            HStack {
                
                Image(
                    systemName: progress.isCompleted(problem)
                    ? "checkmark.circle.fill"
                    : "circle"
                )
                
                Text(
                    progress.isCompleted(problem)
                    ? "Completed"
                    : "Mark as Complete"
                )
                .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                progress.isCompleted(problem)
                ? Color.green.opacity(0.2)
                : Color.red
            )
            .foregroundStyle(
                progress.isCompleted(problem)
                ? .green
                : .white
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
    }
}


