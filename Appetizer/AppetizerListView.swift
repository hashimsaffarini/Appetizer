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
        .navigationTitle("🍟 Appetizer")
    }
}

#Preview {
    AppetizerListView()
}
