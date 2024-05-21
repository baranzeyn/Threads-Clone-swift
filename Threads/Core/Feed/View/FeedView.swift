//
//  FeedView.swift
//  Threads
//
//  Created by Zeynep Baran on 14.05.2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(viewModel.threads){thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task{
                    try await viewModel.fetchThreads()
                }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                }label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
    }
}
