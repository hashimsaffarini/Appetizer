//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 29/01/2026.
//

import SwiftUI

@Observable
final class AccountViewModel {
    var firstName = ""
    var lastName = ""
    var email = ""
    var date = Date()
    var extraNapkins = false
    var frequentRefills = false
    var alertItem  : AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("Saving changes for: \(firstName) \(lastName)")
    }
}
