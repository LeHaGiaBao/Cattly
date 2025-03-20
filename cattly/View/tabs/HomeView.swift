//
//  HomeView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct StoryCircle: View {
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color("PrimaryColor"), lineWidth: 2)
                )
        }
    }
}

struct PostCard: View {
    let username: String
    let userImage: String
    let postImage: String
    @State var isLiked: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Post image
            ZStack(alignment: .topTrailing) {
                Image(postImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                
                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .foregroundColor(.white)
                        .padding(8)
                }
            }
            
            // User info and actions
            HStack {
                HStack(spacing: 8) {
                    Image(userImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(username)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .foregroundColor(Color("GrayColor"))
                }
                .padding(.horizontal, 4)
                
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : Color("GrayColor"))
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}

struct HomeView: View {
    let stories = ["cat1", "cat2", "cat3", "cat4", "cat5"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Stories row
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(stories, id: \.self) { story in
                                StoryCircle(imageName: story)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                    
                    // Posts
                    PostCard(
                        username: "Sharon",
                        userImage: "cat3",
                        postImage: "cat_post1",
                        isLiked: true
                    )
                    
                    PostCard(
                        username: "Whiskers",
                        userImage: "cat2",
                        postImage: "cat_post2",
                        isLiked: false
                    )
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Cattly")
                        .font(.custom("jsMath-cmmi10", size: 24))
                        .fontWeight(.medium)
                        .foregroundColor(Color("PrimaryColor"))
                        .italic()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell")
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
