//
//  Appetizer.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 25/01/2026.
//

import Foundation

struct Appetizer: Identifiable, Codable {
    let id: Int
    let itemName: String
    let itemDescription: String
    let itemPrice: Double
    let restaurantName: String
    let restaurantID: Int
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "itemID"
        case itemName
        case itemDescription
        case itemPrice
        case restaurantName
        case restaurantID
        case imageUrl
    }
}

struct MockData {
    static let sampleAppetizers = Appetizer(
        id: 1,
        itemName: "Afghan Kebabs",
        itemDescription: "Grilled kebabs made with marinated lamb, served with naan.",
        itemPrice: 450,
        restaurantName: "Peacock Rooftop Restaurant",
        restaurantID: 28,
        imageUrl: "burger"
    )
    
    static let appetizer = [sampleAppetizers , sampleAppetizers , sampleAppetizers , sampleAppetizers]

}
