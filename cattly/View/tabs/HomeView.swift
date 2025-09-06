//
//  HomeView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct HomeView: View {
    @State private var likedPosts: Set<Int> = []
    
    let storyProfiles = [
        ("https://i.natgeofe.com/n/4cebbf38-5df4-4ed0-864a-4ebeb64d33a4/NationalGeographic_1468962.jpg", "Whiskers", Color("PrimaryColor")),
        ("https://cdn.omlet.com/images/originals/breed_abyssinian_cat.jpg", "Mittens", Color("TextColor")),
        ("https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip", "Luna", Color("TextColor")),
        ("https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?cs=srgb&dl=pexels-pixabay-104827.jpg&fm=jpg", "Oliver", Color("PrimaryColor")),
        ("https://www.alleycat.org/wp-content/uploads/2024/04/alley-our-bnr.jpg", "Bella", Color("TextColor"))
    ]
    
    let feedPosts = [
        FeedPost(id: 1, username: "Sharon", userImage: "https://i.natgeofe.com/n/4cebbf38-5df4-4ed0-864a-4ebeb64d33a4/NationalGeographic_1468962.jpg", postImage: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?cs=srgb&dl=pexels-pixabay-104827.jpg&fm=jpg", isLiked: false),
        FeedPost(id: 2, username: "Fluffy", userImage: "https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip", postImage: "https://cdn.britannica.com/34/235834-050-C5843610/two-different-breeds-of-cats-side-by-side-outdoors-in-the-garden.jpg", isLiked: true),
        FeedPost(id: 3, username: "Fluffy", userImage: "https://www.alleycat.org/wp-content/uploads/2024/04/alley-our-bnr.jpg", postImage: "https://www.vets4pets.com/siteassets/species/cat/two-cats-on-wall-in-sun.jpg", isLiked: false),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Stories section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(Array(storyProfiles.enumerated()), id: \.offset) { index, profile in
                                VStack(spacing: 8) {
                                    AsyncImage(url: URL(string: profile.0)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Circle()
                                            .fill(profile.2)
                                    }
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(profile.2, lineWidth: 2)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    
                    
                    // Feed section
                    LazyVStack(spacing: 20) {
                        ForEach(feedPosts) { post in
                            FeedCardView(
                                post: post,
                                isLiked: likedPosts.contains(post.id)
                            ) {
                                    // Toggle like
                                if likedPosts.contains(post.id) {
                                    likedPosts.remove(post.id)
                                } else {
                                    likedPosts.insert(post.id)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
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
