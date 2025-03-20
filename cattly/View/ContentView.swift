//
//  ContentView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 16/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text(NSLocalizedString("cattly", comment: "cattly"))
                .font(.largeTitle)
                .padding()
            Button(action: {
                print("Button tapped!")
            }) {
                Text(NSLocalizedString("get_started", comment: "get_started"))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
