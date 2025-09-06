//
//  FeedCard.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 6/9/25.
//

import SwiftUI

struct FeedPost: Identifiable {
    let id: Int
    let username: String
    let userImage: String
    let postImage: String
    let isLiked: Bool
}

struct FeedCardView: View {
    let post: FeedPost
    let isLiked: Bool
    let onLikeToggle: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
                // Main post image with bookmark
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: post.postImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                }
                .frame(width: UIScreen.main.bounds.width - 32,height: 300)
                .clipped()
                
                    // Bookmark button
                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.black.opacity(0.3))
                        .clipShape(Circle())
                }
                .padding(.top, 12)
                .padding(.trailing, 12)
            }
            
                // User info and actions
            HStack(spacing: 12) {
                    // User profile image
                AsyncImage(url: URL(string: post.userImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                
                    // Username
                Text(post.username)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                
                Spacer()
                
                    // Action buttons
                HStack(spacing: 16) {
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                            .font(.system(size: 20))
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: onLikeToggle) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 20))
                            .foregroundColor(isLiked ? .red : .primary)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
        }
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
    }
}
