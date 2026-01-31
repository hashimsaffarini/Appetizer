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
                TextField("First Name", text: $viewModel.user.firstName)
                TextField("Last Name", text: $viewModel.user.lastName)
                TextField("Email", text: $viewModel.user.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                DatePicker("Birthday", selection: $viewModel.user.date, displayedComponents: .date)
            }
            Section(header : Text("Requests")){
                Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
            }
            .tint(.accentColor)
            
        }
        .task {
            viewModel.retrieveUser()
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
