//
//  AppetizerListCell.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 25/01/2026.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageUrl)) { phase in
                          switch phase {
                          case .empty:
                              ProgressView()
                                  .frame(width: 120, height: 90)

                          case .success(let image):
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 120, height: 90)
                                  .clipShape(RoundedRectangle(cornerRadius: 8))

                          case .failure:
                              Image(systemName: "photo")
                                  .frame(width: 120, height: 90)

                          @unknown default:
                              EmptyView()
                          }
                      }
            
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
