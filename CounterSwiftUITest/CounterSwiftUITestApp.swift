//
//  CounterSwiftUITestApp.swift
//  CounterSwiftUITest
//
//  Created by Светлана Сенаторова on 05.07.2023.
//

import SwiftUI

@main
struct CounterSwiftUITestApp: App {
    
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager())
        }
    }
}
