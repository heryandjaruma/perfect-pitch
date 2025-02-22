//
//  StoryView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            BackgroundWall()
            
            HStack(alignment: .top) {
                BackButton(backText: "Do I Have Perfect Pitch")
                    .padding(.leading, 16) // Add some padding from the left edge
                    .padding(.top, 16)    // Add some padding from the top edge
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    StoryView()
}
