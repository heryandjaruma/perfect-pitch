//
//  SwiftUIView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StoryBoard: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button(action: {
                
            }) {
                Image("PrevButton")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: screenWidth / 30 * 4)
            Rectangle()
                .fill(.white)
                .cornerRadius(10)
                .opacity(0.75)
                .shadow(radius: 5)
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
    StoryBoard()
}
