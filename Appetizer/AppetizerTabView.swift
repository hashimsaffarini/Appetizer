//
//  ContentView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 24/01/2026.
//

import SwiftUI

enum AppTab: Hashable {
    case home, order , account
}


struct AppetizerTabView: View {
    @State private var selection: AppTab = .home
    var body: some View {
        TabView (selection: $selection){
            Tab("Home", systemImage: "house" , value: .home) {
                NavigationStack {
                    AppetizerListView()
                        .navigationTitle("🍟 Appetizer")
                }
            }
            Tab("Order", systemImage: "bag" , value: .order) {
                NavigationStack {
                    OrderView()
                        .navigationTitle("🛒 Order")
                }
            }
            Tab("Account", systemImage: "person" , value: .account) {
                NavigationStack {
                    AccountView()
                        .navigationTitle("👤 Account")
                }
            }
        }
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
