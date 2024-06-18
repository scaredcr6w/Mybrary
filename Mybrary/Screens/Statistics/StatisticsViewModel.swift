//
//  StatisticsViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import Foundation

struct BooksRead : Identifiable{
    let id = UUID()
    let month: String
    let booksRead: Int
}

class StatisticsViewModel : ObservableObject{
    @Published var booksArray: [BooksRead] = [
        .init(month: "Jan", booksRead: 2),
        .init(month: "Feb", booksRead: 4),
        .init(month: "Mar", booksRead: 1),
        .init(month: "Apr", booksRead: 6),
        .init(month: "Maj", booksRead: 3),
        .init(month: "Jun", booksRead: 5)
    ]
}
