//
//  StatisticsViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 30/06/2024.
//

import Foundation

final class StatisticsViewModel : ObservableObject {
    private let calendar = Calendar.current
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }

    func getReadBooksByMonth(bookArray: [Book]) -> [(month: String, count: Int)] {
        var booksByMonth: [(month: String, count: Int, order: Int)] {
            let grouped = Dictionary(grouping: bookArray.filter { $0.isRead }) { book -> DateComponents in
                calendar.dateComponents([.year, .month], from: book.purchaseDate)
            }
            
            let monthCounts = grouped.map { (key, value) -> (month: String, count: Int, order: Int) in
                let date = calendar.date(from: key)!
                let monthName = dateFormatter.string(from: date)
                return (month: monthName, count: value.count, order: key.month!)
            }
            
            return monthCounts.sorted { $0.order < $1.order }
        }
        return booksByMonth.map { (month: $0.month, count: $0.count) }
    }
    
    func getMonthlySpendings(bookArray: [Book]) -> [(month: String, spent: Int)] {
        var monthlySpendings: [(month: String, spent: Int, order: Int)] {
            let grouped = Dictionary(grouping: bookArray.filter { !$0.isWishlisted }) { book -> DateComponents in
                calendar.dateComponents([.year, .month], from: book.purchaseDate)
            }
            
            let monthSpent = grouped.map { (key, value) -> (month: String, spent: Int, order: Int) in
                let date = calendar.date(from: key)!
                let monthName = dateFormatter.string(from: date)
                return (month: monthName, spent: value.reduce(0, { $0 + $1.price }), order: key.month!)
            }
            
            return monthSpent.sorted { $0.order < $1.order }
        }
        
        return monthlySpendings.map { (month: $0.month, spent: $0.spent) }
    }
}
