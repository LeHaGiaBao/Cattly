//
//  MessagesView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct MessagesView: View {
    let rooms = [
        Room(name: "Living room", imageName: "livingroom", isActive: true),
        Room(name: "Kitchen room", imageName: "kitchenroom", isActive: false),
        Room(name: "Bed room", imageName: "bedroom", isActive: false)
    ]
    
    let petActivities = [
        "activity1", "activity2", "activity3",
        "activity4", "activity5", "activity6"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Room cards section
                    VStack(spacing: 16) {
                        ForEach(rooms, id: \.name) { room in
                            RoomCard(room: room)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("what_did_your_pet_do_today", comment: "what_did_your_pet_do_today"))
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                        ForEach(petActivities, id: \.self) { activity in
                            ActivityCard(imageName: activity)
                        }
                    }
                    .padding(.top, 16)
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(NSLocalizedString("what_did_your_pet_do_today", comment: "what_did_your_pet_do_today"))
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("PrimaryColor"))
                        
                        Text(NSLocalizedString("let_find_your_pet", comment: "let_find_your_pet"))
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color("GrayColor"))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 4) {
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .font(.system(size: 12))
                                .foregroundColor(Color("BlackColor"))
                                .frame(width: 28, height: 28)
                                .contentShape(Rectangle())
                        }
                        .background(Color("PrimaryColor"))
                        .cornerRadius(.infinity)
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {}) {
                            Image("noti")
                                .foregroundColor(Color("PrimaryColor"))
                                .frame(width: 28, height: 28)
                        }
                    }
                }
            }.padding(.top, 24)
        }
    }
}

#Preview {
    MessagesView()
}
