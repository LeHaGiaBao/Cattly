//
//  HomeView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct Cat: Identifiable {
    let id = UUID()
    let imageURL: URL
}

struct SearchView: View {
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
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                        // Search Bar
                    HStack {
                        Image("search")
                        TextField(NSLocalizedString("search_on_cattly", comment: "search_on_cattly"), text: $searchText)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color("TextColor").opacity(0.8))
                    }
                    .padding()
                    .background(Color("GreyColor").opacity(0.4))
                    .cornerRadius(50)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 16)
                    
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
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SearchView()
}
