//
//  RoomCard.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 7/6/25.
//

import SwiftUI

struct RoomCard: View {
    let room: Room
    let totalHorizontalPadding: CGFloat = 32
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let imageWidth = screenWidth - totalHorizontalPadding
        
        NavigationLink(destination: CallView(room: room)) {
            ZStack {
                    // Background image
                Image(room.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageWidth, height: 120)
                    .clipped()
                    .cornerRadius(16)
                
                    // Overlay gradient
                LinearGradient(
                    colors: [Color.black.opacity(0.6), Color.clear],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
                .cornerRadius(16)
                
                    // Content overlay
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {}) {
                            ZStack {
                                Circle()
                                    .fill(Color.black.opacity(0.3))
                                    .frame(width: 24, height: 24)
                                
                                Image(systemName: "info")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.top, 12)
                    .padding(.trailing, 12)
                    
                    Spacer()
                    
                    HStack {
                        HStack(spacing: 8) {
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8, height: 8)
                                
                                if room.isActive {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 12, height: 12)
                                        .opacity(0.3)
                                }
                            }
                            
                            Text(room.name)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color("WhiteColor"))
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom, 16)
                    .padding(.leading, 16)
                }
            }
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        }
    }
}
