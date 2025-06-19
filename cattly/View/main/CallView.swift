    //
    //  Call.swift
    //  cattly
    //
    //  Created by Bao Le Ha Gia on 16/6/25.
    //
import SwiftUI

struct CallView: View {
    let room: Room
    @State private var isFullScreen = false
    
    var body: some View {
        VStack(spacing: 16) {
                // Top Navigation Bar
            HStack {
                Button(action: {
                }) {
                    Image("arrow-left")
                        .frame(width: 28, height: 28)
                }
                
                Spacer()
                
                Text(room.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color("PrimaryColor"))
                
                Spacer()
                
                Button(action: {}) {
                    Image("noti")
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(width: 28, height: 28)
                }
            }
            .padding(.horizontal)
            
            ZStack(alignment: .topLeading) {
                Image("call1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 550)
                    .clipped()
                    .cornerRadius(12)
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    
                    Text(NSLocalizedString("live", comment: "live"))
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("WhiteColor"))
                }
                .padding(8)
                .cornerRadius(10)
                .padding(8)
            }
            .padding(.top, 24)
            .padding(.horizontal)
            
            HStack(spacing: 20) {
                ForEach(["full-screen", "video", "camera", "voice", "sound", "call"], id: \.self) { icon in
                    Button(action: {
                        if icon == "full-screen" {
                            isFullScreen = true
                        }
                    }) {
                        Image(icon)
                            .frame(width: 50, height: 50)
                            .background(icon == "call" ? Color("RedColor") : Color("SecondaryColor"))
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.vertical, 24)
            
            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $isFullScreen) {
            FullScreenCallView(room: room, isPresented: $isFullScreen)
        }
    }
}

struct FullScreenCallView: View {
    let room: Room
    @Binding var isPresented: Bool
    @State private var showingControls = true
    @State private var isRecording = true
    
    var body: some View {
        ZStack {
                // Background image/video feed
            Image("call1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
                // Dark overlay for better text visibility
            Color.black.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                    // Top navigation bar
                HStack {
                    HStack(spacing: 6) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .opacity(isRecording ? 1.0 : 0.5)
                            .scaleEffect(isRecording ? 1.2 : 1.0)
                            .animation(
                                isRecording ?
                                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true) :
                                        .default,
                                value: isRecording
                            )
                        
                        Text(NSLocalizedString("live", comment: "live"))
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(12)
                    
                    Spacer()
                }
                .padding(.horizontal, 32)
                .padding(.top, 8)
                
                Spacer()
                
                    // Bottom control buttons
                if showingControls {
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                                // Exit full screen button
                            FullScreenControlButton(
                                imageName: "minimize",
                                backgroundColor: Color("SecondaryColor"),
                                action: {
                                    isPresented = false
                                }
                            )
                            
                                // Video recording button
                            FullScreenControlButton(
                                imageName: "video",
                                backgroundColor: Color("SecondaryColor"),
                                action: {
                                    isRecording.toggle()
                                }
                            )
                            
                                // Photo capture button
                            FullScreenControlButton(
                                imageName: "camera",
                                backgroundColor: Color("SecondaryColor"),
                                action: { }
                            )
                            
                                // Microphone button
                            FullScreenControlButton(
                                imageName: "voice",
                                backgroundColor: Color("SecondaryColor"),
                                action: {
                                }
                            )
                            
                                // Speaker/Audio button
                            FullScreenControlButton(
                                imageName: "sound",
                                backgroundColor: Color("SecondaryColor"),
                                action: { }
                            )
                            
                                // Call/Phone button
                            FullScreenControlButton(
                                imageName: "call",
                                backgroundColor: Color("RedColor"),
                                action: { }
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 34) // Safe area padding
                    }
                    .background(
                        LinearGradient(
                            colors: [Color.clear, Color.black.opacity(0.3)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                showingControls.toggle()
            }
        }
    }
}

struct FullScreenControlButton: View {
    let imageName: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(imageName)
                .frame(width: 50, height: 50)
                .background(backgroundColor)
                .clipShape(Circle())
                .shadow(color: backgroundColor.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .scaleEffect(1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: UUID())
    }
}
