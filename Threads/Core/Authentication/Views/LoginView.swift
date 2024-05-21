//
//  LoginView.swift
//  Threads
//
//  Created by Zeynep Baran on 14.05.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel=LoginViewModel()
    
    var body: some View {
        NavigationStack{
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
                }
                NavigationLink{
                    Text("Forgot password")
                }label:{
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundColor(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                }
                Button{
                    Task{
                        try await viewModel.login()
                    }
                }label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifiers())
                }
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    HStack(spacing:3){
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical,16)
            }
        }
    }
}

#Preview {
    LoginView()
}
