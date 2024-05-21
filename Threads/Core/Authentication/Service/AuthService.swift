//
//  AuthService.swift
//  Threads
//
//  Created by Zeynep Baran on 17.05.2024.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService{
    
    @Published var userSession:FirebaseAuth.User?
    
    static let shared=AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email:String,password:String) async throws{
        do{
            let result=try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession=result.user
            try await UserService.shared.fetchCurrentUser()
         }catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email:String,password:String,fullname:String,username:String) async throws{
        do{
            let result=try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession=result.user
            try await uploadUserData(withEmail: email, password: password, fullname: fullname, username: username, id: result.user.uid)
        }catch {
            print("DEBUG: failed to create user with error \(error.localizedDescription)")
        }
        
    }
    
    func signOut(){
        try? Auth.auth().signOut()//backendde çıkış
        self.userSession=nil//oturumdan çıkış
        UserService.shared.reset()//uygulamada giriş yapılmış hesap kalmaz
    }
    @MainActor
    private func uploadUserData(
        withEmail email:String,
        password:String,
        fullname:String,
        username:String,
        id:String)
     async throws{
        let user=User(id: id, fullname: fullname, email: email, username: username)
         guard let userData = try? Firestore.Encoder().encode(user) else {return}
         try await Firestore.firestore().collection("users").document(id).setData(userData)
         UserService.shared.currentUser=user
    }
    
}
