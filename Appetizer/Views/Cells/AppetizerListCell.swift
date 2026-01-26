//
//  AppetizerListCell.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 25/01/2026.
//

import SwiftUI
import Kingfisher

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            KFImage(URL(string: appetizer.imageUrl))
                .onFailureImage(UIImage(systemName: "photo"))
                .placeholder {
                    ZStack {
                        Color.gray.opacity(0.1)
                        ProgressView()
                        
                    }
                    .frame(width: 120, height: 90)
                }
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 90)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            

            
            VStack (alignment: .leading, spacing: 5){
                Text(appetizer.itemName)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.itemPrice, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizers)
}
