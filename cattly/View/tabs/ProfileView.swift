//
//  ProfileView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var isFollowing = false
    
    @State private var searchText = ""
    let totalHorizontalPadding: CGFloat = 32
    let interColumnSpacing: CGFloat = 16
    
    let cats: [Cat] = [
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/960px-Cat_November_2010-1a.jpg",
        "https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "https://images.unsplash.com/photo-1615497001839-b0a0eac3274c?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGN1dGUlMjBjYXR8ZW58MHx8MHx8fDA%3D",
        "https://cdn.prod.website-files.com/5f3930c295835a33b247d015/63e7c77f4bd9077488c1c4a5_blog%20post%20images%20(3).png",
        "https://bowwowinsurance.com.au/wp-content/uploads/2018/10/siberian-cat-700x700.jpg",
        "https://www.dailypaws.com/thmb/d3vNqnLf6Vqjz8oz5XObGCQxms4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/tiny-white-kitten-873941684-2000-0bac130389984aba9751de5e5e50d25f.jpg",
        "https://preview.redd.it/cute-cat-v0-wyi1gvbdxzia1.jpg?auto=webp&s=455798c6ad92b6eba913f046467847499bc6bc4d",
        "https://i.pinimg.com/236x/c6/2e/47/c62e47ccce4e8e568c9c7e381032bde9.jpg"
    ].compactMap { URL(string: $0) }.map { Cat(imageURL: $0) }
    
    func randomHeight(for id: UUID) -> CGFloat {
        let hash = abs(id.hashValue) % 4
        return [150, 180, 220, 250][hash]
    }
    
    var filteredCats: [Cat] {
        if searchText.isEmpty {
            return cats
        } else {
            return cats.filter { $0.imageURL.absoluteString.contains(searchText.lowercased()) }
        }
    }
    
        // Split cats into 2 columns
    var leftColumnCats: [Cat] {
        filteredCats.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil }
    }
    
    var rightColumnCats: [Cat] {
        filteredCats.enumerated().compactMap { $0.offset % 2 != 0 ? $0.element : nil }
    }
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let imageWidth = (screenWidth - totalHorizontalPadding - interColumnSpacing) / 2
        
        ScrollView {
            VStack(spacing: 0) {
                // Header with background image and profile picture
                ZStack(alignment: .bottom) {
                        // Background header image
                    AsyncImage(url: URL(string: "https://www.cdc.gov/healthy-pets/media/images/2024/04/Cat-on-couch.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                    }
                    .frame(height: 200)
                    .clipped()
                    
                        // Overlay gradient
                    LinearGradient(
                        colors: [Color.clear, Color.black.opacity(0.3)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 200)
                    
                    // Camera button (bottom right)
                    ZStack(alignment: .bottomTrailing) {
                        Color.clear // or your background
                        Button(action: {}) {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .frame(width: 40, height: 40)
                                .background(Color.black.opacity(0.5))
                                .clipShape(Circle())
                        }
                        .padding(16)
                    }
                    .frame(height: 200)
                    
                        // Profile picture
                    VStack {
                        Spacer()
                        ZStack(alignment: .bottomTrailing) {
                            AsyncImage(url: URL(string: "https://www.alleycat.org/wp-content/uploads/2024/04/alley-our-bnr.jpg")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                            }
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                            )
                            
                                // Camera icon on profile
                            Button(action: {}) {
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12))
                                    .frame(width: 28, height: 28)
                                    .background(Color.black.opacity(0.7))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .offset(y: 60)
                }
                
                    // Profile info section
                VStack(spacing: 12) {
                    Spacer()
                        .frame(height: 70)
                    
                        // Name
                    Text("Sharon")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color("BlackColor"))
                        .multilineTextAlignment(.center)
                    
                        // Bio
                    Text("I'm not lazy, I'm in energy-saving mode :3")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("TextColor"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                        // Followers count
                    Text("Followed by 2141 people")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("TextColor"))
                    
                        // Action buttons
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "plus")
                                Text(NSLocalizedString("add_new", comment: "add_new"))

                            }
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color("WhiteColor"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 36)
                            .background(Color.orange)
                            .cornerRadius(18)
                        }
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "bookmark")
                                Text(NSLocalizedString("saved", comment: "saved"))
                            }
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color("BlackColor"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 36)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "pencil")
                                Text(NSLocalizedString("edit_profile", comment: "edit_profile"))
                            }
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color("BlackColor"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 36)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
                
                // Masonry Layout
                HStack(alignment: .top, spacing: 16) {
                        // Left Column
                    LazyVStack(spacing: 16) {
                        ForEach(leftColumnCats) { cat in
                            AsyncImage(url: cat.imageURL) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: imageWidth, height: randomHeight(for: cat.id))
                            .clipped()
                            .cornerRadius(12)
                            .shadow(color: Color("ShadowColor").opacity(0.35), radius: 20, x: 0, y: 10)
                        }
                    }
                    
                        // Right Column
                    LazyVStack(spacing: 16) {
                        ForEach(rightColumnCats) { cat in
                            AsyncImage(url: cat.imageURL) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: imageWidth, height: randomHeight(for: cat.id))
                            .clipped()
                            .cornerRadius(12)
                            .shadow(color: Color("ShadowColor").opacity(0.35), radius: 20, x: 0, y: 10)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ProfileView()
}
