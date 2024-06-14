//
//  HeaderScrollView.swift
//  Mybrary
//
//  Created by Anda Levente on 14/06/2024.
//

import SwiftUI

struct HeaderScrollView: View {
    @ObservedObject var viewModel = HeaderScrollViewModel()
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(viewModel.headerCardsArray){ card in
                    TallCardView(cardTitle: card.cardTitle,
                                 cardDescription: card.cardDescription,
                                 cardColor: card.cardColor,
                                 cardIcon: card.cardIcon)
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
                    
                }
            }
            .scrollTargetLayout()
        }
        .frame(height: 340)
        .contentMargins(25, for: .scrollContent)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    HeaderScrollView()
}
