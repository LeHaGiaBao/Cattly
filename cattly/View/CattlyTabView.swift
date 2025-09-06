//
//  CattlyTabView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct CattlyTabView: View {
    @State private var selectedTab = 0
    @State private var showCreatePost = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(selectedTab == 0 ? "home_active" : "home")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(selectedTab == 1 ? "search_active" : "search")
                }
                .tag(1)
            
            Color.clear
                .tabItem {
                    Image("new_post")
                }
                .tag(2)
            
            MessagesView()
                .tabItem {
                    Image(selectedTab == 3 ? "phone_active" : "phone")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image("profile")
                }
                .tag(4)
        }
        .background(Color("WhiteColor"))
        .onChange(of: selectedTab) { newValue in
            if newValue == 2 {
                showCreatePost = true
                selectedTab = 0
            }
        }
        .fullScreenCover(isPresented: $showCreatePost) {
            CreatePostView()
        }
    }
}

#Preview {
    CattlyTabView()
}
