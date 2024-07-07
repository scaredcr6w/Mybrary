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
        NavigationStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.headerCardsArray){ card in
                        NavigationLink(destination: viewModel.destinationView(for: card)){
                            TallCardView(cardTitle: card.cardTitle,
                                         cardDescription: card.cardDescription,
                                         cardColor: card.cardColor,
                                         cardIcon: card.cardIcon)
                            .containerRelativeFrame(.horizontal,
                                                    count: 1,
                                                    spacing: 16)
                            .scrollTransition{ content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.35)
                            }
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 340)
            .contentMargins(30, for: .scrollContent)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    HeaderScrollView()
}
