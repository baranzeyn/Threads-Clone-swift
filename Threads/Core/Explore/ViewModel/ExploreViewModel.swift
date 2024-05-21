//
//  ExploreViewModel.swift
//  Threads
//
//  Created by Zeynep Baran on 18.05.2024.
//

import Foundation
class ExploreViewModel:ObservableObject{
    @Published var users=[User]()
    
    init(){
        Task{
            try await fetchUsers()
        }
    }
    @MainActor
    private func fetchUsers() async throws{
        self.users = try await UserService.fetchUsers()
    }
}
