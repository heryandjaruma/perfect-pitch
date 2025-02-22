//
//  File.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import Foundation

struct PianoKeyModel: Identifiable {
    let name: String
    let frequency: Float
    var id: String { name }
}

let whiteKeys: [PianoKeyModel] = [
    PianoKeyModel(name: "C4", frequency: 261.63),
    PianoKeyModel(name: "D4", frequency: 293.66),
    PianoKeyModel(name: "E4", frequency: 329.63),
    PianoKeyModel(name: "F4", frequency: 349.23),
    PianoKeyModel(name: "G4", frequency: 392.00),
    PianoKeyModel(name: "A4", frequency: 440.00),
    PianoKeyModel(name: "B4", frequency: 493.88),

    PianoKeyModel(name: "C5", frequency: 523.25),
    PianoKeyModel(name: "D5", frequency: 587.33),
    PianoKeyModel(name: "E5", frequency: 659.25),
    PianoKeyModel(name: "F5", frequency: 698.46),
    PianoKeyModel(name: "G5", frequency: 783.99),
    PianoKeyModel(name: "A5", frequency: 880.00),
    PianoKeyModel(name: "B5", frequency: 987.77),

    PianoKeyModel(name: "C6", frequency: 1046.50)
]

let blackKeys: [PianoKeyModel] = [
    PianoKeyModel(name: "C#4", frequency: 277.18),
    PianoKeyModel(name: "D#4", frequency: 311.13),

    PianoKeyModel(name: "F#4", frequency: 369.99),
    PianoKeyModel(name: "G#4", frequency: 415.30),
    PianoKeyModel(name: "A#4", frequency: 466.16),
    
    PianoKeyModel(name: "C#5", frequency: 554.37),
    PianoKeyModel(name: "D#5", frequency: 622.25),

    PianoKeyModel(name: "F#5", frequency: 739.99),
    PianoKeyModel(name: "G#5", frequency: 830.61),
    PianoKeyModel(name: "A#5", frequency: 932.33)
]

