//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Zeynep Baran on 19.05.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user:User?
    init(user:User?){
        self.user=user
    }
    var body: some View {
        HStack(alignment:.top){
                VStack(alignment:.leading,spacing: 4 ) {
                    //fullname and username
                    VStack(alignment:.leading,spacing: 4 ){
                        Text(user?.fullname ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(user?.username ?? "")
                            .font(.subheadline)
                    }
                    //bio değeri yazmak opsiyonel olduğundan bu şekilde yapmak genel yapıyı bozmaz
                    if let bio = user?.bio{
                        Text(bio)
                            .font(.footnote)
                    }
                    
                    Text("2 followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
            CircularProfileImageView(user: user,size: .medium)
        }
        .padding()
        }
    }


struct ProfileHeaderView_Preview:PreviewProvider{
    static var previews: some View{
        ProfileHeaderView(user: dev.user)
    }
}
