//
//  WishlistBooks.swift
//  Mybrary
//
//  Created by Anda Levente on 22/06/2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var author: String
    var title: String
    var price: Int
    var purchaseDate: Date
    var isWishlisted: Bool
    var isRead: Bool
    
    
    init(author: String, title: String, price: Int, purchaseDate: Date, isWishlisted: Bool, isRead: Bool) {
        self.author = author
        self.title = title
        self.price = price
        self.purchaseDate = purchaseDate
        self.isWishlisted = isWishlisted
        self.isRead = isRead
    }
}
