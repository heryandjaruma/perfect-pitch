//
//  GameState.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import Foundation

class GameState: ObservableObject {
    @Published var storyWrongGuesses: Int = 0
    
    @Published var practiceGuesses: Int = 0
    @Published var correctGuesses: Int = 0
    
    func incrementStoryWrongGuesses() {
        self.storyWrongGuesses += 1
    }
    
    func resetPracticeStats() {
        self.practiceGuesses = 0
        self.correctGuesses = 0
    }
    
    func incrementPracticeGuesses(isCorrect: Bool) {
        self.practiceGuesses += 1
        if isCorrect {
            self.correctGuesses += 1
        }
    }
}
