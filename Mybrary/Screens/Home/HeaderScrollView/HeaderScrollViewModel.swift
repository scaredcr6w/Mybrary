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

class HeaderScrollViewModel : ObservableObject{
    @Published var headerCardsArray: [HeaderCards] = [
        HeaderCards(cardTitle: "Statisztika", cardDescription: "Nézd meg az ehavi adataid", cardColor: .purple, cardIcon: "chart.pie"),
        HeaderCards(cardTitle: "Kihívások", cardDescription: "Nagyon nehéz", cardColor: .pink, cardIcon: "checkmark.square"),
        HeaderCards(cardTitle: "Év könyve", cardDescription: "Az év abszolút győztese", cardColor: .mint, cardIcon: "flag.checkered")
    ]
}
