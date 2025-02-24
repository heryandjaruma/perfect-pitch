//
//  NavigationState.swift
//  Perfect Pitch
//
//  Created by Heryan Djaruma on 24/02/25.
//

import Foundation
import SwiftUI

class NavigationState: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path = NavigationPath()
    }
}
