//
//  HomeView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(NSLocalizedString("cattly", comment: "cattly"))
                        .font(.custom("jsMath-cmmi10", size: 32))
                        .fontWeight(.medium)
                        .foregroundColor(Color("PrimaryColor"))
                        .italic()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image("noti")
                            .foregroundColor(Color("PrimaryColor"))
                            .frame(width: 28, height: 28)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
