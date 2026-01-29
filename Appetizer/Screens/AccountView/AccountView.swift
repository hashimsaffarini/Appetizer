//
//  AccountView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 24/01/2026.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var date = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    
    var body: some View {
        Form{
            Section(header : Text("Personal Info")){
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                DatePicker("Birthday", selection: $date, displayedComponents: .date)
            }
            Section(header : Text("Requests")){
                Toggle("Extra Napkins", isOn: $extraNapkins)
                Toggle("Frequent Refills", isOn: $frequentRefills)
            }
            .tint(.accentColor)
            
        }
        .navigationTitle("👤 Account")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    print("Saved")
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
