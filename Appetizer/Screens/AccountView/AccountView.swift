//
//  AccountView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 24/01/2026.
//

import SwiftUI

struct AccountView: View {
    @State private var viewModel = AccountViewModel()
    
    var body: some View {
        Form{
            Section(header : Text("Personal Info")){
                TextField("First Name", text: $viewModel.firstName)
                TextField("Last Name", text: $viewModel.lastName)
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                DatePicker("Birthday", selection: $viewModel.date, displayedComponents: .date)
            }
            Section(header : Text("Requests")){
                Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
            }
            .tint(.accentColor)
            
        }
        .navigationTitle("👤 Account")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    viewModel.saveChanges()
                }
            }
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }    }
}

#Preview {
    AccountView()
}
