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
    @Query var statisticsData: [Book]
    @ObservedObject private var viewModel = StatisticsViewModel()
    var booksReadCount: Int {
        viewModel.getReadBooksByMonth(bookArray: statisticsData).reduce(0) { $0 + $1.count }
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
