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
    var purchaseDate: Date?
    var bookDescription: String
    var rating: Int?
    var ratingBody: String?
    var isWishlisted: Bool
    var isRead: Bool
    var coverImage: Data?
    
    init(author: String, title: String, price: Int, purchaseDate: Date? = nil, bookDescription: String, rating: Int? = nil, ratingBody: String? = nil, isWishlisted: Bool, isRead: Bool, coverImage: Data? = nil) {
        self.author = author
        self.title = title
        self.price = price
        self.purchaseDate = purchaseDate
        self.bookDescription = bookDescription
        self.rating = rating
        self.ratingBody = ratingBody
        self.isWishlisted = isWishlisted
        self.isRead = isRead
        self.coverImage = coverImage
    }
}
