//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Zeynep Baran on 18.05.2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel:ObservableObject{
    @Published var currentUser:User?
    private var cancellables=Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink{ [weak self] user in
            self?.currentUser = user
            
        }.store(in:&cancellables)  
    }
    

}
