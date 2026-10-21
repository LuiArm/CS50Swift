//
//  ContentStore.swift
//  CS50Swift
//
//  Created by luis armendariz on 10/16/26.
//

import Foundation

final class ContentStore {
    static let shared = ContentStore()
    private(set) var problems: [Problem] = []
    
    private init() {
        load()
    }
    
    private func load() {
        guard let url = Bundle.main.url(forResource: "problems", withExtension: "json") else {
           assertionFailure("Could not find problems.json in main bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            problems = try JSONDecoder().decode([Problem].self, from: data)
        } catch {
            assertionFailure("Fauled to load problems.json: \(error)")
        }
    }
    
    func problems(for week: Int) -> [Problem] {
        problems.filter { $0.week == week }
    }
    
    func search(_ query: String) -> [Problem] {
        guard !query.isEmpty else { return problems }
        
        let query = query.lowercased()
        
        return problems.filter { problem in
            problem.title.lowercased().contains(query)
            
            || problem.summary.lowercased().contains(query)
            
            || problem.category.lowercased().contains(query)
            
            || problem.concepts.contains { $0.lowercased().contains(query) }
        }
    }
}
