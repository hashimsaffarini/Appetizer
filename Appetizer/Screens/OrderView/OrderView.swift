//
//  OrderView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 24/01/2026.
//

import SwiftUI

struct OrderView: View {
    
    @Environment(Order.self) private var order
    
    var body: some View {
        ZStack{
            VStack {
                List {
                    ForEach(order.items) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: order.remove)
                }
                .listStyle(PlainListStyle())
                Button {
                    
                } label: {
                    APButton(title: "$\(order.totalePrice, specifier: "%.2f") - Place Order")
                }
                .padding(.bottom , 25)
            }
            if order.items.isEmpty {
                EmptyState(imageName: "empty-order", message: "Your order is empty")
            }
        }
            .navigationTitle("🛒 Order")
    }
    
}

#Preview {
    OrderView()
        .environment(Order())
}
