//
//  ThreadsButtonModifiers.swift
//  Threads
//
//  Created by Zeynep Baran on 14.05.2024.
//

import SwiftUI

struct ThreadsButtonModifiers:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352,height: 44)
            .background(.black)
            .cornerRadius(8)
    }
}
