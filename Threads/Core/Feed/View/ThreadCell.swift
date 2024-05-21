//
//  ThreadCell.swift
//  Threads
//
//  Created by Zeynep Baran on 14.05.2024.
//

import SwiftUI

struct ThreadCell: View {
    let thread : Thread
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
                CircularProfileImageView(user: thread.user,size: .small)
                VStack(alignment: .leading, spacing: 4) {
                    //username
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    //thread
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    
                    HStack(spacing:16){
                        Button{
                        }label: {
                            Image(systemName: "heart")
                        }
                        
                        Button{
                        }label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button{
                        }label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button{
                        }label: {
                            Image(systemName: "paperplane")
                        }
                        
                    }
                    .foregroundColor(.black)
                    .padding(.vertical,8)
                }
            }
            Divider()
        }
        .padding()
    }
}

struct ThreadCell_Previews:PreviewProvider{
    static var previews: some View{
        ThreadCell(thread: dev.thread)
    }
}

