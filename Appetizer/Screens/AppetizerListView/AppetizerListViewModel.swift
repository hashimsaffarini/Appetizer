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
    var alertItem: AlertItem?
    var isLoading = false
    var isShowingDetail = false
    var selectedAppetizer: Appetizer?

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
        } catch let error as APError {
            switch error {
            case .invalidURL:
                alertItem = AlertContext.invalidURL
            case .invalidResponse:
                alertItem = AlertContext.invalidResponse
            case .invalidData:
                alertItem = AlertContext.invalidData
            case .unableToComplete:
                alertItem = AlertContext.unableToComplete
            case .statusCode:
                alertItem = AlertContext.invalidResponse
            case .decodingFailed:
                alertItem = AlertContext.unableToComplete
            }
        } catch {
            alertItem = AlertContext.unableToComplete
        }
    }
}
