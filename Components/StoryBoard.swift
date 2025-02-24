//
//  StoryBoard.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StoryBoard<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(10)
                    .opacity(0.75)
                    .shadow(radius: 5)
                self.content
            }

        }
    }
}

#Preview {
    StoryBoard(content: {
        Text("Hello Story Board")
    })
}
