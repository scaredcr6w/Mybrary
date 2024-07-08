//
//  HeaderScrollViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 14/06/2024.
//

import Foundation
import SwiftUI

struct HeaderCards : Identifiable{
    let id = UUID()
    let cardTitle: String
    let cardDescription: String
    let cardColor: Color
    let cardIcon: String
}

final class HeaderScrollViewModel : ObservableObject{
    @Published var headerCardsArray: [HeaderCards] = [
        HeaderCards(cardTitle: "Statisztika", cardDescription: "Nézd meg az ehavi adataid", cardColor: Color.primaryMaroon, cardIcon: "chart.pie"),
        HeaderCards(cardTitle: "Kihívások", cardDescription: "Nagyon nehéz", cardColor: Color.primaryPink, cardIcon: "checkmark.square"),
        HeaderCards(cardTitle: "Év könyve", cardDescription: "Az év abszolút győztese", cardColor: Color.primaryLightPink, cardIcon: "flag.checkered")
    ]
    
    @ViewBuilder func destinationView(for card: HeaderCards) -> some View{
        switch card.cardTitle{
        case "Statisztika":
            StatisticsView()
        case "Kihívások":
            ChallangesView()
        case "Év könyve":
            BOTYView()
        default:
            Text("Default")
        }
    }
}
