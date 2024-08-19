//
//  FrostedSwiftUIDemoApp.swift
//  FrostedSwiftUIDemo
//
//  Created by Sakun Acharige on 8/16/24.
//

import SwiftUI
import FrostedUI_Swift

@main
struct FrostedSwiftUIDemoApp: App {
    
    init() {
        InterDisplayFont.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
