import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var sampleManager = SampleManager()
    
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
                .environmentObject(sampleManager)
        }
    }
}
