//
//  DismissButton.swift
//  Mybrary
//
//  Created by Anda Levente on 28/06/2024.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 40, height: 40)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    DismissButton()
}
