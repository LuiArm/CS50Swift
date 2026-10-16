//
//  HomeView.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progress: ProgressStore
    
    private var nextProblem: Problem? {
        CourseData.problems.first {
            !progress.isCompleted($0)
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    
                    progressCard
                    
                    if let problem = nextProblem {
                        continueCard(problem)
                    }
                    
                    weeksSection
                }
                .padding()
            }
        }
        .navigationTitle("CS50 Swift")
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Welcome to CS50 Swift!")
                .font(.largeTitle)
                .bold()
            
            Text("This course is designed to help you learn Swift, a modern programming language.")
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
    
    private var progressCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Your Progress")
                    .font(.title)
                
                Spacer()
                
                Text("\(Int(progress.completionPercentage * 100))%")
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
            }
            
            
            ProgressView(value: progress.completionPercentage)
                .tint(.red)
            
            Text("\(progress.completed.count) of \(CourseData.problems.count) problems completed")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(uiColor: .secondarySystemBackground))
        )
    }
    
    private func continueCard(_ problem: Problem) -> some View {
        NavigationLink {
            ProblemsDetailView(problem: problem)
        } label: {
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("CONTINUE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                
                Text(problem.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(problem.summary)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Text("Week \(problem.week)")
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .font(.subheadline)
                .fontWeight(.medium)
            }
            .foregroundStyle(.primary)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.red.opacity(0.12))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.red.opacity(0.3))
            }
        }
        .buttonStyle(.plain)
    }
    
    private var weeksSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Course")
                .font(.title3)
                .fontWeight(.bold)
            
            ForEach(CourseData.weeks) { week in
                
                NavigationLink {
                    ProblemsView(selectedWeek: week.id)
                } label: {
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text(week.title)
                                .fontWeight(.semibold)
                            
                            Text(week.subtitle)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.secondarySystemBackground))
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    HomeView()
}
