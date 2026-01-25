//
//  APError.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 25/01/2026.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case statusCode(Int)
    case decodingFailed
}
