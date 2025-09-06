//
//  CreatePostView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @State private var selectedImage: UIImage?
    @State private var showingPhotoPicker = false
    @State private var isCreatingStory = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // Navigation Bar
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text(isCreatingStory ? "Share" : "Next")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color("PrimaryColor"))
                        }
                    }
                    .overlay(
                        Text(isCreatingStory ? NSLocalizedString("create_story", comment: "create_story")
                             : NSLocalizedString("create_post", comment: "create_post"))
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("BlackColor"))
                    )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)

                    
                    // Main Content
                    ScrollView {
                        VStack(spacing: 20) {
                            // Selected Image Display
                            ZStack(alignment: .topTrailing) {
                                if let selectedImage = selectedImage {
                                    Image(uiImage: selectedImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: isCreatingStory ? 500 : 300)
                                        .clipped()
                                        .cornerRadius(12)
                                } else {
                                    AsyncImage(url: URL(string: "https://d2zp5xs5cp8zlg.cloudfront.net/image-79322-800.jpg")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Rectangle()
                                            .fill(Color.blue.opacity(0.3))
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 32,height: isCreatingStory ? 500 : 300)
                                    .clipped()
                                    .cornerRadius(12)
                                }
                                
                                // Editing tools (story mode)
                                if isCreatingStory {
                                    VStack(spacing: 16) {
                                        Button(action: {}) {
                                            Image(systemName: "textformat")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .frame(width: 40, height: 40)
                                                .background(Color.black.opacity(0.3))
                                                .clipShape(Circle())
                                        }
                                        
                                        Button(action: {}) {
                                            Image(systemName: "textformat.size")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .frame(width: 40, height: 40)
                                                .background(Color.black.opacity(0.3))
                                                .clipShape(Circle())
                                        }
                                        
                                        Button(action: {}) {
                                            Image(systemName: "timer")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .frame(width: 40, height: 40)
                                                .background(Color.black.opacity(0.3))
                                                .clipShape(Circle())
                                        }
                                    }
                                    .padding(.trailing, 16)
                                    .padding(.top, 16)
                                }
                            }
                            .padding(.horizontal, 16)
                            
                            // Photos Section
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Button(action: {}) {
                                        HStack {
                                            Text("Photos")
                                                .font(.system(size: 16, weight: .medium))
                                                .foregroundColor(.primary)
                                            Image(systemName: "chevron.down")
                                                .font(.system(size: 12))
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    // Camera/Add button
                                    Button(action: { showingPhotoPicker = true }) {
                                        Image(systemName: "camera.fill")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color("WhiteColor"))
                                            .frame(width: 32, height: 32)
                                            .background(Color.orange)
                                            .clipShape(Circle())
                                    }
                                }
                                .padding(.horizontal, 16)
                                
                                // Photo Grid
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: isCreatingStory ? 4 : 3), spacing: 4) {
                                    ForEach(0..<(isCreatingStory ? 8 : 12), id: \.self) { index in
                                        Button(action: {
                                                // Handle photo selection
                                        }) {
                                            AsyncImage(url: URL(string: "https://picsum.photos/100/100?random=\(index)")) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                            } placeholder: {
                                                Rectangle()
                                                    .fill(Color.gray.opacity(0.3))
                                            }
                                            .frame(height: 80)
                                            .clipped()
                                            .cornerRadius(8)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(index == 0 ? Color.orange : Color.clear, lineWidth: 2)
                                            )
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        .padding(.bottom, 80)
                    }
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        isCreatingStory.toggle()
                    }) {
                        HStack(spacing: 16) {
                            Text("POST")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(isCreatingStory ? 0.6 : 1.0)
                            
                            Text("STORY")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                                .opacity(isCreatingStory ? 1.0 : 0.6)
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(25)
                        .shadow(radius: 4)
                    }
                    .padding(.bottom, 20)
                    .padding(.bottom, 20)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CreatePostView()
}
