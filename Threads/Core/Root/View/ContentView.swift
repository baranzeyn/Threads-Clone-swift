//
//  ContentView.swift
//  Threads
//
//  Created by Zeynep Baran on 14.05.2024.
//

import SwiftUI
//kullanıcı giriş yaptıysa threadleri görebilir giriş yapamdıysa direkt giriş sayfasına yolla

struct ContentView: View {
    @StateObject var viewModel=ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                ThreadsTabView()
            }
            else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
