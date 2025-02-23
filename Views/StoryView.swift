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
    
    var body: some View {
        ZStack {
            BackgroundWall()
            
            Keyboard()
                .zIndex(0)
            
            StoryBoard(content: {
                Text("Hello")
            })
                .frame(width: screenWidth * 0.95, height: screenHeight / 5 * 3 * 0.95)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 5 * 2)
                .zIndex(1)
            
            /// BACK
            HStack(alignment: .top) {
                BackButton(backText: "Do I Have Perfect Pitch")
                    .padding(.leading, 16)
                    .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .zIndex(2)
            
        }
    }
}

#Preview {
    StoryView()
}
