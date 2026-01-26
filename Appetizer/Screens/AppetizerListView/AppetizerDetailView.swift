//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 26/01/2026.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer : Appetizer
    
    var body: some View {
        VStack{
            Image("burger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300 , height: 225)
            VStack{
                Text(appetizer.itemName)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.itemDescription)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack (spacing: 30){
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.body)
                        Text("\(appetizer.restaurantID + 20)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.body)
                        Text("\(appetizer.restaurantID + 30)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.body)
                        Text("\(appetizer.restaurantID)")
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            Spacer()
            Button{
                
            }label: {
                Text("$\(appetizer.itemPrice, specifier : "%.1f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260 , height: 50)
                    .foregroundStyle(.white)
                    .background(.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            }
            .padding(.bottom , 30)
        }
        .frame(width: 300 , height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            
        } label: {
            Circle()
                .frame(width: 30 , height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44 , height: 44)
                .foregroundStyle(.black)
        } , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizers)
}
