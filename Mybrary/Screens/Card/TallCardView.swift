//
//  TallCardView.swift
//  Mybrary
//
//  Created by Anda Levente on 14/06/2024.
//

import SwiftUI

struct TallCardView: View {
    let cardTitle: String
    let cardDescription: String
    let cardColor: Color
    let cardIcon: String
    
    var body: some View {
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    Image(systemName: cardIcon)
                        .resizable()
                        .frame(width: 80,height: 80)
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                    Text(cardTitle)
                        .bold()
                        .font(.system(size: 26))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(cardDescription)
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .background(cardColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
        }
}


#Preview {
    TallCardView(cardTitle: "Statisztika", cardDescription: "Nézd meg az ehavi tevékenyseged", cardColor: .pink, cardIcon: "chart.pie")
}
