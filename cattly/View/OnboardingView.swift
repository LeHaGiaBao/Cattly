//
//  OnboardingView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            Image("paw_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color("PrimaryColor"))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                Text(NSLocalizedString("cattly", comment: "cattly"))
                    .font(.custom("jsMath-cmmi10", size: 32))
                    .fontWeight(.medium)
                    .foregroundColor(Color("PrimaryColor")).italic()
                
                Text(NSLocalizedString("welcome_to_cattly", comment: "welcome_to_cattly"))
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("GrayColor")).italic()
                
                Spacer()
                
                // Cat image (no longer needs the paw background)
                Image("cat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Spacer()
                
                Text(NSLocalizedString("share_your_cat_moment", comment: "share_your_cat_moment"))
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("GrayColor")).padding(.top, 50)
                
                HStack(spacing: 8) {
                    Rectangle()
                        .frame(width: 36, height: 4)
                        .foregroundColor(.orange)
                        .cornerRadius(2)
                    
                    Rectangle()
                        .frame(width: 16, height: 4)
                        .foregroundColor(.gray.opacity(0.3))
                        .cornerRadius(2)
                }
                .padding(.top, 5)
                
                Button(action: {
                    isActive = true
                }) {
                    Text(NSLocalizedString("get_started", comment: "get_started"))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 195, height: 56)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(25)
                        .shadow(color: Color("PrimaryColor").opacity(0.5), radius: 10, x: 0, y: 5)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isActive) {
            ContentView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
