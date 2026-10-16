//
//  Problem.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import Foundation

struct Problem: Identifiable, Codable, Hashable {
    let id: String
    let week: Int
    
    let title: String
    let category: String
    let summary: String
    
    let description: String
    
    let concepts: [String]
    
    let hint: String
    let pseudocode: String
    let solution: String
}
