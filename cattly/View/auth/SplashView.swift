//
//  SplashView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 16/3/25.
//

import SwiftUI

struct SplashView: View {
    @Binding var isLoggedIn: Bool
    @State private var isActive = false
    @State private var opacity = 0.0

    var body: some View {
        if isActive {
            OnboardingView(isLoggedIn: $isLoggedIn)
        } else {
            ZStack {
                Color("PrimaryColor") // Custom color from Assets.xcassets
                    .ignoresSafeArea()
                
                Image("splash_logo") // Replace with your image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.opacity = 1.0
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
