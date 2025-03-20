//
//  cattlyApp.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 16/3/25.
//

import SwiftUI

@main
struct CattlyApp: App {
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                CattlyTabView()
            } else {
                SplashView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
