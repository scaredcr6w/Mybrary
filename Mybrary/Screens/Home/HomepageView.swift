//
//  HomepageView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI

struct HomepageView: View {
    var body: some View{
        ScrollView(.vertical){
            VStack(spacing: 30){
                HeaderScrollView()
                Text("Újdonságok")
                    .bold()
                    .font(.system(size: 30))
                WideCardView(cardTitle: "Libri Top 100", cardDescription: "Card", cardImage: "bookCardRead")
                WideCardView(cardTitle: "Új megjelenések", cardDescription: "Card", cardImage: "bookCardRead")
                WideCardView(cardTitle: "Előrendelhetők", cardDescription: "Card", cardImage: "bookCardRead")
            }
        }
        
    }
}

#Preview {
    HomepageView()
}
