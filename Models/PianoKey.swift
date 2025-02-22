//
//  File.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import Foundation

struct PianoKey: Identifiable {
    let name: String
    let frequency: Float
    var id: String { name }
}
