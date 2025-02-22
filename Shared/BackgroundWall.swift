//
//  BackgroundWall.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct BackgroundWall: View {
    var body: some View {
        ZStack {
            Color("Cream")
                .ignoresSafeArea()
            Image("Wall")
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BackgroundWall()
}
