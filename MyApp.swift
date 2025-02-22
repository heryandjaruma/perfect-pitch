import SwiftUI

@main
struct MyApp: App {
    
    init() {
        do {
            try UIFont.registerFonts(withExtension: "ttf")
        } catch {
            print(error)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
