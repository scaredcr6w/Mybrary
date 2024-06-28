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
    var bookDescription: String
    var rating: Decimal
    var ratingBody: String
    var isWishlisted: Bool
    var isRead: Bool
    
    
    init(author: String, title: String, price: Int, purchaseDate: Date, bookDescription: String, rating: Decimal, ratingBody: String, isWishlisted: Bool, isRead: Bool) {
        self.author = author
        self.title = title
        self.price = price
        self.purchaseDate = purchaseDate
        self.bookDescription = bookDescription
        self.rating = rating
        self.ratingBody = ratingBody
        self.isWishlisted = isWishlisted
        self.isRead = isRead
    }
}
