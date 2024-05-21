//
//  RegistrationView.swift
//  Threads
//
//  Created by Zeynep Baran on 14.05.2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel=RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Spacer()
            Image("threads")
                .resizable()
                .scaledToFit()
                .frame(width: 120,height: 120)
                .padding()
            VStack{
                TextField("Enter your email",text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your password",text:$viewModel.password)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your full name",text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your username",text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifiers())
            }
            Button{
                Task{
                    try await viewModel.createUser() 
                }
            }label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifiers())
            }
            .padding(.vertical)
            Spacer()
            
            Divider()
            Button{
                dismiss()
            }label: {
                HStack(spacing: 3){
                    Text("Already have an acoount?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }.padding(.vertical,16)
        }
    }
}

#Preview {
    RegistrationView()
}
