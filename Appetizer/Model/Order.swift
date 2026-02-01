//
//  Order.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 01/02/2026.
//

import SwiftUI

@Observable
final class Order {
    var items : [Appetizer] = []
    
    var totalePrice: Double {
        items.reduce(0) { $0 + $1.itemPrice}
    }
    
    func add(_ item: Appetizer) {
        items.append(item)
    }
    
    func remove(_ item: IndexSet) {
        items.remove(atOffsets: item)
    }
}
