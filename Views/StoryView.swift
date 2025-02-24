//
//  StoryView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StoryView: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    @State private var currentSceneId: String = "StartPrompt"
    @StateObject private var sampleManager: SampleManager
    @StateObject private var keysManager: KeysManager
    @StateObject private var gameState: GameState
    
    init() {
        let sampleMgr = SampleManager()
        let gameStateInstance = GameState()
        self._sampleManager = StateObject(wrappedValue: sampleMgr)
        self._gameState = StateObject(wrappedValue: gameStateInstance)
        self._keysManager = StateObject(wrappedValue: KeysManager(sampleManager: sampleMgr, gameState: gameStateInstance))
    }
    
    private var currentScene: SceneModel? {
        scenes.first { $0.id == currentSceneId }
    }
    
    var body: some View {
        ZStack {
            BackgroundWall()
            
            Keyboard()
                .zIndex(0)

            sceneContent
                .frame(width: screenWidth * 0.95, height: screenHeight / 5 * 3 * 0.95)
                .position(x: screenWidth / 2, y: screenHeight / 5 * 2 )
                .zIndex(1)
            
            backButton
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .zIndex(2)
        }
        .environmentObject(keysManager)
        .environmentObject(gameState)
        .onChange(of: keysManager.isCorrect) { newValue in
            if newValue == true, let scene = currentScene, let nextSceneId = scene.choices["nextHidden"] {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    currentSceneId = nextSceneId
                    keysManager.isCorrect = nil
                    keysManager.keyToGuess = nil
                }
            }
        }
    }
    
    private var sceneContent: some View {
        if let scene = currentScene {
            return AnyView(HStack(alignment: .bottom) {
                prevButton(for: scene)
                
                StoryBoard(content: {
                    switch scene.id {
                    case "StartPrompt":
                        StartPromptView()
                            .frame(maxWidth: .infinity)
                    case "TwelveNotesTheory":
                        TwelveNotesTheoryView()
                            .frame(maxWidth: .infinity)
                    case "NowHearThisNote1":
                        NowHearThisNote1View()
                            .frame(maxWidth: .infinity)
                    case "NowHearThisNote2":
                        NowHearThisNote2View()
                            .frame(maxWidth: .infinity)
                    case "NowHearThisNote3":
                        NowHearThisNote3View()
                            .frame(maxWidth: .infinity)
                    case "Result":
                        ResultView()
                            .frame(maxWidth: .infinity)
                    case "PerfectPitchTheory":
                        PerfectPitchTheoryView()
                            .frame(maxWidth: .infinity)
                    case "PerfectPitchMeaning":
                        PerfectPitchMeaningView()
                            .frame(maxWidth: .infinity)
                    case "RelativePitchTheory":
                        RelativePitchTheoryView()
                            .frame(maxWidth: .infinity)
                    case "MusicIsYourThing":
                        MusicIsYourThingView()
                            .frame(maxWidth: .infinity)
                    case "StartLessonPrompt":
                        StartLessonPromptView()
                            .frame(maxWidth: .infinity)
                    default:
                        Text("")
                    }
                })
                
                nextButton(for: scene)
            })
        } else {
            return AnyView(EmptyView())
        }
    }
    
    private func prevButton(for scene: SceneModel) -> some View {
        Button(action: {
            if let prevSceneId = scene.choices["prev"] {
                currentSceneId = prevSceneId
            }
        }) {
            Image("PrevButton")
                .resizable()
                .scaledToFit()
        }
        .frame(width: screenWidth / 30 * 4)
        .opacity(scene.choices["prev"] != nil ? 1.0 : 0)
        .disabled(scene.choices["prev"] == nil)
    }
    
    private func nextButton(for scene: SceneModel) -> some View {
        Button(action: {
            if let nextSceneId = scene.choices["next"] {
                currentSceneId = nextSceneId
            }
        }) {
            Image("NextButton")
                .resizable()
                .scaledToFit()
        }
        .frame(width: screenWidth / 30 * 4)
        .opacity(scene.choices["next"] != nil ? 1.0 : 0)
        .disabled(scene.choices["next"] == nil)
    }
    
    private var backButton: some View {
        HStack(alignment: .top) {
            BackButton(backText: "Do I Have Perfect Pitch")
                .padding(.leading, 16)
                .padding(.top, 16)
        }
    }
}

#Preview {
    StoryView()
        .environmentObject(SampleManager())
}
