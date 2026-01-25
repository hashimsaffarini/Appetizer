//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 25/01/2026.
//

import Observation

@MainActor
@Observable
final class AppetizerListViewModel {
    var appetizers: [Appetizer] = []
    var isLoading = false

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
            print(appetizers.count)
        } catch {
            print(error)
        }
    }
}
