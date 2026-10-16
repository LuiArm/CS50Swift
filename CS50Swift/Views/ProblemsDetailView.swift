//
//  ProblemsDetailView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct ProblemsDetailView: View {
    
    @EnvironmentObject var progress: ProgressStore
    
    let problem: Problem
    
    @State private var showSolution = false
    
    var body: some View {
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
    
    private var problemSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            sectionTitle("Problem")
            
            Text(problem.description)
                .font(.body)
                .lineSpacing(5)
        }
    }
    
    private var conceptsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            sectionTitle("Concepts")
            
            FlowLayout(items: problem.concepts)
        }
    }
    
    private var hintSection: some View {
        DisclosureGroup("Hint") {
            
            Text(problem.hint)
                .font(.body)
                .foregroundStyle(.secondary)
                .padding(.top, 8)
        }
    }
    
    private var pseudocodeSection: some View {
        DisclosureGroup("Pseudocode") {
            
            CodeBlock(code: problem.pseudocode)
                .padding(.top, 8)
        }
    }
    
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
    
    private var completeButton: some View {
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


