//
//  AboutView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            BackgroundWall()
            VStack {
                HStack {
                    BackButton(backText: "")
                        .padding()
                    Spacer()
                }
                Spacer()
            }
            ScrollView(.vertical) {
                
                VStack(spacing: 40) {
                    Text("About")
                        .font(.extraBeigeBig)
                        .foregroundStyle(Color("Red"))
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        Text("Research")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("Red"))
                            .multilineTextAlignment(.center)
                        Text("Witynski, M. (n.d.). What is perfect pitch? The University of Chicago News. Retrieved from https://news.uchicago.edu/explainer/what-is-perfect-pitch")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("DarkBlue"))
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        Text("Piano Samples")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("Red"))
                            .multilineTextAlignment(.center)
                        Text("Witynski, M. (n.d.). What is perfect pitch? The University of Chicago News. Retrieved from https://github.com/daviddeborin/Piano-Sounds-High-Quality-.git")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("DarkBlue"))
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        Text("Fonts")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("Red"))
                            .multilineTextAlignment(.center)
                        Text("Extra Beige Font - Dafont https://www.dafont.com/extra-beige.font")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("DarkBlue"))
                            .multilineTextAlignment(.center)
                        Text("Tango Sans Font - Dafont https://www.dafont.com/tangosans.font")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("DarkBlue"))
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        Text("Graphical Assets")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("Red"))
                            .multilineTextAlignment(.center)
                        Text("Most of the graphical assets are self-made and created in Figma.")
                            .font(.tangoSansMedium)
                            .foregroundStyle(Color("DarkBlue"))
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width / 4 * 3)
            }
        }
    }
}

#Preview {
    AboutView()
}
