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
        viewModel.getReadBooksByMonth(bookArray: statisticsData).reduce(0) { $0 + $1.count }
    }
    
    var booksReadAvg: Double {
        Double(booksReadCount) / Double(viewModel.getReadBooksByMonth(bookArray: statisticsData).count)
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Olvasott könyvek: \(booksReadCount)")
                    .bold()
                    .font(.system(size: 24))
                Chart {
                    ForEach(Array(viewModel.getReadBooksByMonth(bookArray: statisticsData).enumerated()),
                            id: \.element.month){ _, data in
                        BarMark(x: .value("Hónap", data.month), y: .value("Könyvek", data.count))
                    }
                    
                    RuleMark(y: .value("Átlag", booksReadAvg))
                        .foregroundStyle(.yellow)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation (alignment: .leading) {
                            Text("Átlag")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                }
                .frame(height: 200)
                .chartYScale(domain: 0...10)
            }
            .padding()
            .navigationTitle("Statisztika")
            
            Spacer()
        }
    }
}

#Preview {
    StatisticsView()
}
