//
//  ActivityCard.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 16/6/25.
//

import SwiftUI

struct ActivityCard: View {
    let imageName: String
    let totalHorizontalPadding: CGFloat = 32
    let interColumnSpacing: CGFloat = 16
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let imageWidth = (screenWidth - totalHorizontalPadding - interColumnSpacing) / 3
        
        Image(imageName)
            .aspectRatio(contentMode: .fill)
            .frame(width: imageWidth, height: imageWidth)
            .clipped()
            .cornerRadius(11)
    }
}
