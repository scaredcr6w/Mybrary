//
//  WhislistViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 13/06/2024.
//

import Foundation

struct WishlistCardData: Identifiable{
    let id = UUID()
    let title: String
    let author: String
    let cover: String
}

class WishlistViewModel : ObservableObject{
    @Published var wishlistData: [WishlistCardData] = [
        .init(title: "Feljegyzések az egérlyukból", author: "Dosztojevszkij", cover: "placeholdercover"),
        .init(title: "Karamazov testvérek", author: "Dosztojevszkij", cover: "placeholdercover2")
    ]
}
