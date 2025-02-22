//
//  SwiftUIView.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 22/02/25.
//

import UIKit

extension UIFont {
    static func registerFonts(withExtension _extension: String) throws {
        try Bundle.main
            .urls(
                forResourcesWithExtension: _extension,
                subdirectory: nil
            )?
            .forEach(registerFont)
    }
    
    private static func registerFont(from fontUrl: URL) throws {
        var error: Unmanaged<CFError>?
        
        guard let fontData = try? Data(contentsOf: fontUrl),
              let cgData = CGDataProvider(data: fontData as CFData),
              let cgFont = CGFont(cgData)
        else { throw FontLoadingError.noFontsLoaded }
        CTFontManagerRegisterGraphicsFont(cgFont, &error)
        if let error = error {
            throw error.takeRetainedValue()
        }
    }
    
    private enum FontLoadingError: Error {
        case noFontsLoaded
    }
}
