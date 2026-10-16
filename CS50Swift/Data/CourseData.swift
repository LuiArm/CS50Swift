//
//  CourseData.swift
//  CS50Swift
//
//  Created by luis armendariz on 08/11/26.
//

import Foundation

enum CourseData {
    static let weeks: [CourseWeek] = [
        CourseWeek(
                   id: 0,
                   title: "Week 0",
                   subtitle: "Scratch"
               ),
               CourseWeek(
                   id: 1,
                   title: "Week 1",
                   subtitle: "C"
               ),
               CourseWeek(
                   id: 2,
                   title: "Week 2",
                   subtitle: "Arrays"
               ),
               CourseWeek(
                   id: 3,
                   title: "Week 3",
                   subtitle: "Algorithms"
               ),
               CourseWeek(
                   id: 4,
                   title: "Week 4",
                   subtitle: "Memory"
               ),
               CourseWeek(
                   id: 5,
                   title: "Week 5",
                   subtitle: "Data Structures"
               )
    ]
    
    static let problems: [Problem] = [
        Problem(
                   id: "hello",
                   week: 1, title: "Hello",
                   category: "C",
                   summary: "Write a program that prints hello world.",
                   description: """
                   Write a program that prints "hello, world" followed by a newline.

                   Your program should be implemented in Swift for this version of the course.
                   """,
                   concepts: [
                       "Functions",
                       "Strings",
                       "Console output"
                   ],
                   hint: """
                   Swift's print() function writes text to the console.
                   """,
                   pseudocode: """
                   START

                   Print "hello, world"

                   END
                   """,
                   solution: """
                   import Foundation

                   print("hello, world")
                   """
               ),

               Problem(
                   id: "plurality",
                   week: 3, title: "Plurality",
                   category: "Algorithms",
                   summary: "Simulate a simple plurality election.",
                   description: """
                   Implement a program that determines the winner of a plurality election.

                   Each candidate receives votes from voters. The candidate with the greatest
                   number of votes wins.
                   """,
                   concepts: [
                       "Arrays",
                       "Loops",
                       "Structs",
                       "Searching"
                   ],
                   hint: """
                   Keep track of each candidate's vote count.

                   Once every vote has been processed, iterate through the candidates and
                   find the candidate with the greatest number of votes.
                   """,
                   pseudocode: """
                   For each vote:

                       Find the selected candidate

                       Increase that candidate's vote count

                   Find the candidate with the most votes

                   Print the winner
                   """,
                   solution: """
                   struct Candidate {
                       let name: String
                       var votes: Int
                   }

                   func findWinner(_ candidates: [Candidate]) -> String? {
                       guard let first = candidates.first else {
                           return nil
                       }

                       var winner = first

                       for candidate in candidates.dropFirst() {
                           if candidate.votes > winner.votes {
                               winner = candidate
                           }
                       }

                       return winner.name
                   }

                   let candidates = [
                       Candidate(name: "Alice", votes: 42),
                       Candidate(name: "Bob", votes: 27),
                       Candidate(name: "Charlie", votes: 31)
                   ]

                   if let winner = findWinner(candidates) {
                       print(winner)
                   }
                   """
               ),

               Problem(
                   id: "search",
                   week: 3, title: "Search",
                   category: "Algorithms",
                   summary: "Search for a value in a collection.",
                   description: """
                   Implement a function that searches for a target value inside an array.

                   Return true when the value exists and false otherwise.
                   """,
                   concepts: [
                       "Arrays",
                       "Loops",
                       "Algorithms",
                       "Boolean values"
                   ],
                   hint: """
                   Start at the beginning of the array and compare each element with
                   the target.
                   """,
                   pseudocode: """
                   For every item in the array:

                       If item equals target:
                           return true

                   Return false
                   """,
                   solution: """
                   func contains(_ numbers: [Int], target: Int) -> Bool {
                       for number in numbers {
                           if number == target {
                               return true
                           }
                       }

                       return false
                   }

                   let numbers = [2, 4, 7, 10, 15]

                   print(contains(numbers, target: 7))
                   """
               ),

               Problem(
                   id: "dictionary",
                   week: 2, title: "Dictionary",
                   category: "Arrays",
                   summary: "Count how many times each word appears.",
                   description: """
                   Given an array of words, count the number of occurrences of each word.

                   This problem introduces Swift dictionaries as a useful data structure.
                   """,
                   concepts: [
                       "Arrays",
                       "Dictionaries",
                       "Loops",
                       "Counting"
                   ],
                   hint: """
                   A dictionary can map a word to the number of times you have encountered it.
                   """,
                   pseudocode: """
                   Create an empty dictionary

                   For every word:

                       If the word already exists:
                           increase its count

                       Otherwise:
                           set its count to 1
                   """,
                   solution: """
                   func wordCounts(_ words: [String]) -> [String: Int] {
                       var counts: [String: Int] = [:]

                       for word in words {
                           counts[word, default: 0] += 1
                       }

                       return counts
                   }

                   let words = [
                       "swift",
                       "cs50",
                       "swift",
                       "ios"
                   ]

                   print(wordCounts(words))
                   """
               ),

               Problem(
                   id: "linked-list",
                   week: 5, title: "Linked List",
                   category: "Data Structures",
                   summary: "Build a simple linked list in Swift.",
                   description: """
                   Implement a basic singly linked list.

                   Each node should contain a value and a reference to the next node.
                   """,
                   concepts: [
                       "Structs",
                       "Classes",
                       "References",
                       "Data structures"
                   ],
                   hint: """
                   A linked list consists of nodes. Each node points to the next node.
                   """,
                   pseudocode: """
                   Create a Node

                   Node contains:

                       value
                       next

                   Connect nodes together

                   Traverse the list
                   """,
                   solution: """
                   final class Node {
                       let value: Int
                       var next: Node?

                       init(value: Int) {
                           self.value = value
                       }
                   }

                   let first = Node(value: 10)
                   let second = Node(value: 20)
                   let third = Node(value: 30)

                   first.next = second
                   second.next = third

                   var current: Node? = first

                   while let node = current {
                       print(node.value)
                       current = node.next
                   }
                   """
               )
        
    ]
}
