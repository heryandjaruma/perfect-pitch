//
//  GameState.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import Foundation

class GameState: ObservableObject {
    @Published var storyWrongGuesses: Int = 0
    
    func incrementStoryWrongGuesses() {
        storyWrongGuesses += 1
        print(storyWrongGuesses)
    }
}
