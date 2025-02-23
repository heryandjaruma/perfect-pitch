//
//  SceneModel.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import Foundation
import SwiftUI

struct SceneModel: Identifiable, Sendable {
    var id: String
    let name: String
    let description: String
    let choices: [String: String]
}

let scenes = [
    SceneModel(id: "StartPrompt", name: "Start Scene", description: "", choices: ["next": "TwelveNotesTheory"]),
    SceneModel(id: "TwelveNotesTheory", name: "12 Notes Theory Scene", description: "", choices: ["next": "NowHearThisNote"]),
    SceneModel(id: "NowHearThisNote1", name: "Guess 1 Scene", description: "", choices: ["next": "NowHearThisNote2"]),
    SceneModel(id: "NowHearThisNote2", name: "Guess 2 Scene", description: "", choices: ["next": "NowHearThisNote3"]),
    SceneModel(id: "NowHearThisNote3", name: "Guess 3 Scene", description: "", choices: [
        "continueCorrect3/3": "MightHave",
        "continueCorrect2/3": "OneStepCloser",
        "continueCorrect1/3": "OhNo"
    ]),
    SceneModel(id: "MightHave", name: "Might Have Perfect Pitch Scene", description: "", choices: ["next": "PerfectPitchTheory"]),
    SceneModel(id: "OneStepCloser", name: "One Step Closer Scene", description: "", choices: ["next": "PerfectPitchTheory"]),
    SceneModel(id: "OhNo", name: "Oh No Scene", description: "", choices: ["next": "PerfectPitchTheory"]),
    SceneModel(id: "PerfectPitchTheory", name: "Perfect Pitch Theory Scene", description: "", choices: ["next": "PerfectPitchMeaning"]),
    SceneModel(id: "PerfectPitchMeaning", name: "Perfect Pitch Meaning Scene", description: "", choices: ["next": "RelativePitchTheory"]),
    SceneModel(id: "RelativePitchTheory", name: "Relative Pitch Theory Scene", description: "", choices: ["next": "MusicIsYourThing"]),
    SceneModel(id: "MusicIsYourThing", name: "Music Your Thing Scene", description: "", choices: ["next": "StartLessonPrompt"]),
]
