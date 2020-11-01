//
//  PopUpDemoApp.swift
//  PopUpDemo
//
//  Created by Rand on 11/1/20.
//

import SwiftUI

@main
struct PopUpDemoApp: App {
    @Environment(\.scenePhase) private var phase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .active:
                // App became active
                print("active")
            case .inactive:
                // App became inactive
                print("inactive")
            case .background:
                // App is running in the background
                print("background")
            @unknown default:
                // Fallback for future cases
                print("default")
            }
        }
    }
}
