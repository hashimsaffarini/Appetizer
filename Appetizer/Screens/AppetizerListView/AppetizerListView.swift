//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Hashim Saffarini on 24/01/2026.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var viewModel = AppetizerListViewModel()

    
    var body: some View {
        ZStack{
            List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                 //   .listRowSeparator(.hidden)
                    .onTapGesture {
                        viewModel.selectedAppetizer = appetizer
                        viewModel.isShowingDetail = true
                    }
            }
            .disabled(viewModel.isShowingDetail)
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer! , isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }
        .task {
            await viewModel.load()
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }
        .navigationTitle("🍟 Appetizer")
        
    }
}

#Preview {
    AppetizerListView()
}
