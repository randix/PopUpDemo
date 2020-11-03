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
    @ObservedObject var shared = Shared()
    
    var body: some Scene {
        WindowGroup {
            ContentView(shared: shared)
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .active:
                // App became active
                print("active")
                shared.showPopup = true
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
