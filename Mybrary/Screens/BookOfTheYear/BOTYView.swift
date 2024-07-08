//
//  BOTYView.swift
//  Mybrary
//
//  Created by Anda Levente on 08/07/2024.
//

import SwiftUI

struct BOTYView: View {
    var body: some View {
        ContentUnavailableView {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.gray)
                .padding()
            Text("Hamarosan...")
                .font(.title)
        }
    }
}


#Preview {
    BOTYView()
}
