//
//  BackButton.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 23/02/25.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var backText: String
    
    var body: some View {
        Button(action: {dismiss()}, label: {
            HStack {
                Image("ChevronLeft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 69, minHeight: 69)
                Text(backText)
                    .font(.extraBeigeSmall)
                    .foregroundStyle(Color("Red"))
            }
        })

    }
}

#Preview {
    BackButton(backText: "Back")
}
