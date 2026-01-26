//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 25/01/2026.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://fakerestaurantapi.runasp.net/api/Restaurant"
    static let appetizerURL = baseURL + "/items"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer]{
        guard let url = URL(string: Self.appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse else {
            throw APError.invalidResponse
        }
        guard (200...299).contains(http.statusCode) else {
            throw APError.statusCode(http.statusCode)
        }
        
        do {
            return try JSONDecoder().decode([Appetizer].self, from: data)
        } catch {
            throw APError.decodingFailed
        }
    }
}
