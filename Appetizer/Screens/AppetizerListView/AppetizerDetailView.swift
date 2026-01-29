//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 26/01/2026.
//

import SwiftUI
import Kingfisher

struct AppetizerDetailView: View {
    let appetizer : Appetizer
    @Binding var isShowingDetail : Bool
    
    var body: some View {
        VStack{
            KFImage(URL(string: appetizer.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 225)
                .clipped()
            
            VStack{
                Text(appetizer.itemName)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.itemDescription)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack (spacing: 30){
                    NutritionInfo(title: "Calories", value: appetizer.restaurantID + 20)
                    NutritionInfo(title: "Carbs", value: appetizer.restaurantID + 30)
                    NutritionInfo(title: "Protein", value: appetizer.restaurantID)
                }
            }
            Spacer()
            Button{
            }label: {
                APButton(title: "$\(appetizer.itemPrice, specifier : "%.1f") - Add to Order")
                
            }
            .padding(.bottom , 30)
        }
        .frame(width: 300 , height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        } , alignment: .topTrailing)
    }
}

struct NutritionInfo : View {
    let title : String
    let value : Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.body)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizers , isShowingDetail: .constant(false))
}
