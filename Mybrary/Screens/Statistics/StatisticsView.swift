//
//  StatisticsView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import SwiftUI
import SwiftData
import Charts

struct StatisticsView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.colorScheme) var colorScheme
    @Query var statisticsData: [Book]
    @ObservedObject private var viewModel = StatisticsViewModel()
    
    var booksReadCount: Int {
        viewModel.getReadBooksByMonth(bookArray: statisticsData).reduce(0, { $0 + $1.count })
    }
    
    var booksReadAvg: Double {
        Double(booksReadCount) / Double(viewModel.getReadBooksByMonth(bookArray: statisticsData).count)
    }
    
    var yearlySpendings: Int {
        viewModel.getMonthlySpendings(bookArray: statisticsData).reduce(0, { $0 + $1.spent })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Évi olvasott könyvek")
                        .bold()
                        .font(.system(size: 24))
                    Text("\(booksReadCount) db")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                    Chart {
                        ForEach(Array(viewModel.getReadBooksByMonth(bookArray: statisticsData).enumerated()),
                                id: \.element.month){ _, data in
                            BarMark(x: .value("Hónap", data.month), y: .value("Könyvek", data.count))
                        }
                        
                        RuleMark(y: .value("Átlag", booksReadAvg))
                            .foregroundStyle(.yellow)
                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                            .annotation (alignment: .leading) {
                                Text("Átlag \(String(format: "%.2f", booksReadAvg))")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                    }
                    .frame(height: 200)
                    .chartYScale(domain: 0...10)
                }
                
                VStack(alignment: .leading) {
                    Text("Éves kiadás")
                        .bold()
                        .font(.system(size: 24))
                    Text("\(yearlySpendings) Ft")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                    
                    Chart {
                        ForEach(Array(viewModel.getMonthlySpendings(bookArray: statisticsData).enumerated()),
                                id: \.element.month) { _, data in
                            LineMark(x: .value("Hónap", data.month), y: .value("Kiadás", data.spent))
                        }
                    }
                    .frame(height: 200)
                    .chartYScale(domain: 0...25000)
                }
            }
            .padding()
            .navigationTitle("Statisztika")
        }
    }
}

#Preview {
    StatisticsView()
}
