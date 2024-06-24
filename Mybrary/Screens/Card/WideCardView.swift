//
//  CardView.swift
//  Mybrary
//
//  Created by Anda Levente on 13/06/2024.
//

import SwiftUI

struct WideCardView: View {
    @Environment(\.colorScheme) var colorScheme
    let cardTitle: String
    let cardDescription: String
    let cardImage: String
    
    var body: some View {
        VStack {
            Image(cardImage)
                .resizable()
                .frame(height: 170)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(cardTitle)
                    .bold()
                    .font(.system(size: 24))
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(cardDescription)
                    .font(.system(size: 16))
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .frame(width: 325, height: 80)
        }
        .frame(width: 325, height: 250)
        .background(colorScheme == .dark ? Color.primaryGrey : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        
    }
}

#Preview {
    WideCardView(cardTitle: "Card title",
             cardDescription: "Card Description",
             cardImage: "bookCardNotRead")
}
