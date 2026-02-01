//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 24/01/2026.
//

import SwiftUI

@main
struct AppetizerApp: App {
    
   @State private var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environment(order)
        }
    }
}
