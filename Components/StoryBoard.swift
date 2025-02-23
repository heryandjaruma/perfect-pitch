//
//  SwiftUIView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StoryBoard<Content: View>: View {
    
    let content: Content
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button(action: {
                
            }) {
                Image("PrevButton")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: screenWidth / 30 * 4)
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(10)
                    .opacity(0.75)
                    .shadow(radius: 5)
                self.content
            }
            Button(action: {
                
            }) {
                Image("NextButton")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: screenWidth / 30 * 4)
        }
    }
}

#Preview {
    StoryBoard(content: {
        Text("Hello Story Board")
    })
}
