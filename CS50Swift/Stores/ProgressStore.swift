//
//  ProgressStore.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import Foundation
import Combine

// Central app state for tracking completed and favorite problems; persists via UserDefaults
final class ProgressStore: ObservableObject {
    
    // IDs of problems the user has completed
    @Published private(set) var completed: Set<String> = []
    // IDs of problems the user has favorited
    @Published private(set) var favorites: Set<String> = []
    
    // UserDefaults keys
    private let completedKey = "completedProblems"
    private let favoritesKey = "favoriteProblems"
    
    // Load persisted progress on startup
    init() {
        load()
    }
    
    // Check if a problem is completed
    func isCompleted(_ problem: Problem) -> Bool {
        completed.contains(problem.id)
    }
    
    // Check if a problem is favorited
    func isFavorite(_ problem: Problem) -> Bool {
        favorites.contains(problem.id)
    }
    
    // Toggle completion state and persist
    // if already completed, remove it
    // if not insert it
    func toggleCompleted(_ problem: Problem) {
        if isCompleted(problem) {
            completed.remove(problem.id)
        } else {
            completed.insert(problem.id)
        }
        save()
    }
    
    // Fraction of completed problems across the entire course
    var completionPercentage: Double {
        guard !CourseData.problems.isEmpty else { return 0 }
        
        return Double(completed.count) / Double(CourseData.problems.count)
    }
    
    // Persist sets as arrays in UserDefaults
    private func save() {
        UserDefaults.standard.set(Array(completed), forKey: completedKey)
        UserDefaults.standard.set(Array(favorites), forKey: favoritesKey)
    }
    
    // Restore sets from arrays stored in UserDefaults
    private func load() {
        if let savedCompleted = UserDefaults.standard.array(forKey: completedKey) as? [String] {
            completed = Set(savedCompleted)
        }
        
        if let savedFavorites = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            favorites = Set(savedFavorites)
        }
    }
}

