//
//  ProgressStore.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import Foundation
import Combine

final class ProgressStore: ObservableObject {
    
    // Set of problems that user has completed
    @Published private(set) var completed: Set<String> = []
    // Set of problems that user has favorited
    @Published private(set) var favorites: Set<String> = []
    
    private let completedKey = "completedProblems"
    private let favoritesKey = "favoriteProblems"
    
    init() {
        load()
    }
    
    // check if problem is in the completed set
    func isCompleted(_ problem: Problem) -> Bool {
        completed.contains(problem.id)
    }
    
    // check if problem is in the favorite set
    func isFavorite(_ problem: Problem) -> Bool {
        favorites.contains(problem.id)
    }
    
    // toggles a problems completion status
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
    
    // return the fraction of the completed problems over the total number of problems
    var completionPercentage: Double {
        guard !CourseData.problems.isEmpty else { return 0 }
        
        return Double(completed.count) / Double(CourseData.problems.count)
    }
    
    private func save() {
        UserDefaults.standard.set(Array(completed), forKey: completedKey)
        UserDefaults.standard.set(Array(favorites), forKey: favoritesKey)
    }
    
    // loads persisted arrays from UserDefaults and converts back to sets
    private func load() {
        if let savedCompleted = UserDefaults.standard.array(forKey: completedKey) as? [String] {
            completed = Set(savedCompleted)
        }
        
        if let savedFavorites = UserDefaults.standard.array(forKey: favoritesKey) as? [String] {
            favorites = Set(savedFavorites)
        }
    }
}
