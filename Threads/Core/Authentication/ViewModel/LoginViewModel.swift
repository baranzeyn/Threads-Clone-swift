//
//  LoginViewModel.swift
//  Threads
//
//  Created by Zeynep Baran on 17.05.2024.
//

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published  var email=""
    @Published  var password=""
    
    @MainActor
    func login() async throws{
        print("DEBUG: create user here...")
        try await AuthService.shared.login (withEmail: email, password: password)
        
    }
}

