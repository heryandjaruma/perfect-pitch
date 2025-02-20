//
//  CustomFont.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 21/02/25.
//

import SwiftUI

struct CustomFont {
    
    private init() {
        let extraBeigeFontURL = Bundle.main.url(forResource: "ExtraBeige", withExtension: "ttf")
        
        CTFontManagerRegisterFontsForURL(extraBeigeFontURL! as CFURL, CTFontManagerScope.process, nil)
    }
    static let shared = CustomFont()
    
    func extraBeigeFontURL(size: CGFloat) -> UIFont {
        return UIFont(name: "ExtraBeige", size: size)!
    }
}
