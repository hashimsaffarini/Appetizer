//
//  EmptyState.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 01/02/2026.
//

import SwiftUI

struct EmptyState: View {
    let imageName : String
    let message : String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "No orders yet")
}
