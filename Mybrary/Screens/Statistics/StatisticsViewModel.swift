//
//  StatisticsViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 30/06/2024.
//

import Foundation

class StatisticsViewModel : ObservableObject {
        
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            return formatter
    }
      
    func getReadBooksByMonth(bookArray: [Book]) -> [(month: String, count: Int)] {
        var booksByMonth: [(month: String, count: Int)] {
            let calendar = Calendar.current
            let grouped = Dictionary(grouping: bookArray.filter { $0.isRead }) { book -> DateComponents in
                calendar.dateComponents([.year, .month], from: book.purchaseDate)
            }
            let monthCounts = grouped.map { (key, value) -> (month: String, count: Int) in
                let date = calendar.date(from: key)!
                let monthName = dateFormatter.string(from: date)
                return (month: monthName, count: value.count)
            }
            return monthCounts.sorted { $0.month < $1.month }
        }
        return booksByMonth
    }
}
