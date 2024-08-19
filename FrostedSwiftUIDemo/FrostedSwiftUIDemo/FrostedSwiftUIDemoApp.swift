//
//  FrostedSwiftUIDemoApp.swift
//  FrostedSwiftUIDemo
//
//  Created by Sakun Acharige on 8/19/24.
//

import SwiftUI
import FrostedUI_Swift

@main
struct FrostedSwiftUIDemoApp: App {
    
    init() {
        FrostedUI.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
