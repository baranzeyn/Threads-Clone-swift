//
//  EditProfileView.swift
//  Threads
//
//  Created by Zeynep Baran on 16.05.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user:User
    @State private var bio=""
    @State private var link=""
    @State private var isPrivateProfile=false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom,.horizontal ])
                VStack{
                    //name and profile image
                    HStack{
                        VStack(alignment:.leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        }
                        .font(.footnote)
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem){
                            //fotoğrafı varsa direkt ekle
                            if let image = viewModel.profileImage{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40,height: 40)
                                    .clipShape(Circle())
                            }else{//yoksa default ata
                                CircularProfileImageView(user: user,size: .small )
                            }
                        }
                    }
                    Divider()
                    //bio field
                    
                    VStack(alignment:.leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...",text: $bio,axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment:.leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...",text: $link,axis: .vertical)
                    }
                    
                    Divider()
                    
                    Toggle("Private Profile",isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray6),lineWidth: 1 )
                }
                .padding()
            }
            
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    //en sola
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    //en sağa
                    Button("Done"){
                        Task{
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

struct EditProfileView_Previews:PreviewProvider{
    static var previews: some View{
        EditProfileView(user: dev.user)
    }
}
